#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include <algorithm>
#include <llvm/IR/Constants.h>
#include <unordered_map>
#include <vector>

using namespace llvm;

namespace {

  struct OurReassociateExpressionsPass : public FunctionPass {

    static char ID;
    std::unordered_map<Value*, unsigned> RankMap;
    std::vector<Instruction*> RootsToProcess;
    std::vector<Instruction*> InstructionsToRemove;

    bool isRoot(BinaryOperator* BO1) {
      BinaryOperator* BO2;
      for (User* U : BO1->users())
        if ((BO2 = dyn_cast<BinaryOperator>(U)) && BO2->getOpcode() == BO1->getOpcode())
          return false;
      return true;
    }

    bool isSuitableOperation(Instruction* I) {
      switch (I->getOpcode()) {
      case Instruction::Add:
      case Instruction::Mul:
      case Instruction::FAdd:
      case Instruction::FMul:
      case Instruction::And:
      case Instruction::Or:
      case Instruction::Xor:
                            return true;
      default:
                            return false;
      }
    }

    unsigned computeRank(Instruction* I) {

      if (BinaryOperator *BO = dyn_cast<BinaryOperator>(I)) {
        unsigned LeftRank = getRank(BO->getOperand(0));
        unsigned RightRank = getRank(BO->getOperand(1));
        return std::max(LeftRank, RightRank) + 1;
      }

      return 1;
    }

    unsigned getRank(Value* V) {

      if (isa<Constant>(V))
        return 0;

      if (RankMap.count(V))
        return RankMap[V];

      Instruction* I = dyn_cast<Instruction>(V);
      return computeRank(I);

    }

    void assignRankToInstr(Instruction* I) {
      if (isSuitableOperation(I)) {
        BinaryOperator* BO = dyn_cast<BinaryOperator>(I);

        Value* L = BO->getOperand(0);
        Value* R = BO->getOperand(1);

        if (isa<Constant>(L))
          RankMap[L] = 0;
        if (isa<Constant>(R))
          RankMap[R] = 0;

        RankMap[BO] = std::max(RankMap[L], RankMap[R]) + 1;
      } else
        RankMap[I] = 1;
    }

    void linearize(Instruction* I, std::vector<Value*>& Linearized) {
      if (std::find(InstructionsToRemove.begin(), InstructionsToRemove.end(), I) == InstructionsToRemove.end())
        InstructionsToRemove.push_back(I);

      unsigned InstrOpcode = I->getOpcode();
      BinaryOperator* BO = dyn_cast<BinaryOperator>(I);

      Value* L = BO->getOperand(0);
      Value* R = BO->getOperand(1);

      BinaryOperator* BO1 = dyn_cast<BinaryOperator>(L);
      BinaryOperator* BO2 = dyn_cast<BinaryOperator>(R);

      bool CanGoDeeperLeft = BO1 && BO1->getOpcode() == InstrOpcode;
      bool CanGoDeeperRight = BO2 && BO2->getOpcode() == InstrOpcode;

      if (!CanGoDeeperLeft && !CanGoDeeperRight) {
        Linearized.push_back(L);
        Linearized.push_back(R);
      }
      else if (CanGoDeeperLeft && !CanGoDeeperRight) {
        linearize(BO1, Linearized);
        Linearized.push_back(R);
      }
      else if (!CanGoDeeperLeft && CanGoDeeperRight) {
        Linearized.push_back(L);
        linearize(BO2, Linearized);
      }
      else if (CanGoDeeperLeft && CanGoDeeperRight) {
        linearize(BO1, Linearized);
        linearize(BO2, Linearized);
      }

    }

    bool areIdenticalOperands(Value* V1, Value* V2) {
      if (V1 == V2)
        return true;

      if (!isa<Instruction>(V1) || !isa<Instruction>(V2))
        return false;

      Instruction* I1 = cast<Instruction>(V1);
      Instruction* I2 = cast<Instruction>(V2);

      if (I1->getOpcode() != I2->getOpcode())
        return false;

      if (LoadInst* L1 = dyn_cast<LoadInst>(I1)) {
        LoadInst* L2 = cast<LoadInst>(I2);
        return L1->getPointerOperand() == L2->getPointerOperand();
      }

      if (CallInst* C1 = dyn_cast<CallInst>(I1)) {
        CallInst* C2 = cast<CallInst>(I2);
        if (C1->getCalledFunction() != C2->getCalledFunction())
          return false;
      }

      if (I1->getNumOperands() != I2->getNumOperands())
        return false;

      for (int i = 0; i < I1->getNumOperands(); i++) {
        if (!areIdenticalOperands(I1->getOperand(i), I2->getOperand(i))) {
          return false;
        }
      }

      return true;
    }

    void mergeSameOperandsToMul(std::vector<Value*>& NotConstants, unsigned Opcode) {
      if (Opcode != Instruction::Add && Opcode != Instruction::FAdd)
        return;

      std::vector<unsigned> toRemove(NotConstants.size(), 0);
      std::vector<unsigned> isRepresentative(NotConstants.size(), 0);

      for (int i = 0; i < NotConstants.size(); i++) {
        for (int j = i + 1; j < NotConstants.size(); j++) {
          if (areIdenticalOperands(NotConstants[i], NotConstants[j]) && isRepresentative[j] == 0 &&
            toRemove[j] == 0) {
            if (isRepresentative[i] == 0)
              isRepresentative[i] += 2;
            else
              isRepresentative[i]++;
            toRemove[j] = 1;
            }
        }
      }

      std::vector<Value*> Concat;

      for (int i = 0; i < isRepresentative.size(); i++) {
        if (isRepresentative[i] > 1) {
          Instruction* I = dyn_cast<Instruction>(NotConstants[i]);
          if (Opcode == Instruction::Add) {
            ConstantInt* Multiplier = ConstantInt::get(Type::getInt32Ty(I->getContext()), isRepresentative[i]);
            BinaryOperator* Mul = BinaryOperator::Create(Instruction::Mul, NotConstants[i], Multiplier, "", I->getNextNode());
            Concat.push_back(Mul);
          }
          if (Opcode == Instruction::FAdd) {
            Constant* Multiplier = ConstantFP::get(Type::getDoubleTy(I->getContext()), (double)isRepresentative[i]);
            BinaryOperator* FMul = BinaryOperator::Create(Instruction::FMul, NotConstants[i], Multiplier, "", I->getNextNode());
            Concat.push_back(FMul);
          }
        }
      }


      for (int i = 0; i < toRemove.size(); i++) {
        Instruction* I = dyn_cast<Instruction>(NotConstants[i]);
        if (toRemove[i]) {
          //ovde treba napraviti neku funkciju koja ce skroz do dna da "iscisti" sve sto se tice ove instrukcije I
          NotConstants[i] = nullptr;
        }
        if (isRepresentative[i] > 1) {
          NotConstants[i] = nullptr;
        }
      }

      NotConstants.erase(std::remove(NotConstants.begin(), NotConstants.end(), nullptr), NotConstants.end());

      for (Value* V : Concat)
        NotConstants.push_back(V);

      Concat.clear();

    }


    void processInstruction(Instruction* I, std::vector<Value*>& Linearized) {

      std::stable_sort(Linearized.begin(), Linearized.end(), [this](Value* A, Value* B){
         return getRank(A) > getRank(B);
      });

      std::vector<Value*> Constants;
      std::vector<Value*> NotConstants;

      for (Value* V : Linearized) {
        if (isa<Constant>(V))
          Constants.push_back(V);
        else
          NotConstants.push_back(V);
      }

      mergeSameOperandsToMul(NotConstants, I->getOpcode());
      //treba nastaviti sa obradom Linearized niza i kreiranjem novih instrukcija i optimizovanog IR-a
    }

    OurReassociateExpressionsPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {

      //treba dodati resenje da se "odmota" fmuladd instrukcija jer automatski spaja u jednu instrukciju kad vidi fmul pa na to fadd,
      //pravice nam problem za optimizaciju

      for (BasicBlock &BB : F)
        for (Instruction &I : BB) {
          assignRankToInstr(&I);

          if (isSuitableOperation(&I) && isRoot(dyn_cast<BinaryOperator>(&I)))
            RootsToProcess.push_back(&I);
        }

      for (Instruction* I : RootsToProcess) {
        std::vector<Value*> Linearized;
        linearize(I, Linearized);
        processInstruction(I, Linearized);
      }

      //posle odredjenih optimizacija IR-a, na ovom mestu treba zameniti Mul sa Shl kao sledeca optimizacija (Strength reduction)

      for (auto it = InstructionsToRemove.rbegin(); it != InstructionsToRemove.rend(); it++)
        (*it)->eraseFromParent();

      return true;
    }
  };
}

char OurReassociateExpressionsPass::ID = 0;
static RegisterPass<OurReassociateExpressionsPass> X("our-reassociate-expressions", "");