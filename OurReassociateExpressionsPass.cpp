#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include <llvm/IR/Constants.h>
#include <algorithm>
#include <deque>
#include <unordered_map>
#include <vector>

using namespace llvm;

namespace {

struct OurReassociateExpressionsPass : public FunctionPass {

  static char ID;
  std::unordered_map<Value *, unsigned> RankMap;
  std::vector<Instruction *> RootsToProcess;
  std::vector<Instruction *> InstructionsToRemove;

  bool isRoot(BinaryOperator *BO1) {
    BinaryOperator *BO2;
    for (User *U : BO1->users())
      if ((BO2 = dyn_cast<BinaryOperator>(U)) && BO2->getOpcode() == BO1->getOpcode())
        return false;
    return true;
  }

  bool isSuitableOperation(Instruction *I) {
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

  unsigned computeRank(Instruction *I) {

    if (BinaryOperator *BO = dyn_cast<BinaryOperator>(I)) {
      unsigned LeftRank = getRank(BO->getOperand(0));
      unsigned RightRank = getRank(BO->getOperand(1));
      return std::max(LeftRank, RightRank) + 1;
    }

    return 1;
  }

  unsigned getRank(Value *V) {

    if (isa<Constant>(V))
      return 0;

    if (RankMap.count(V))
      return RankMap[V];

    Instruction *I = dyn_cast<Instruction>(V);
      return computeRank(I);
  }

  void assignRankToInstr(Instruction *I) {
    if (isSuitableOperation(I)) {
      BinaryOperator *BO = dyn_cast<BinaryOperator>(I);

      Value *L = BO->getOperand(0);
      Value *R = BO->getOperand(1);

      if (isa<Constant>(L))
        RankMap[L] = 0;
      if (isa<Constant>(R))
        RankMap[R] = 0;

      RankMap[BO] = std::max(RankMap[L], RankMap[R]) + 1;
    } else
      RankMap[I] = 1;
  }

  void toRemoveToBottom(Instruction* I) {

      if (!I)
        return;

      if (std::find(InstructionsToRemove.begin(), InstructionsToRemove.end(), I) == InstructionsToRemove.end())
        InstructionsToRemove.push_back(I);

      if (isa<LoadInst>(I))
        return;

      for (Value* Operand : I->operands()) {
        if (Instruction* OperandInstr = dyn_cast<Instruction>(Operand))
          toRemoveToBottom(OperandInstr);
      }
    }

    void toRemoveAllOperands(std::vector<Value*>& Linearized) {
      for (Value* V : Linearized) {
        Instruction* I = dyn_cast<Instruction>(V);
        toRemoveToBottom(I);
      }
    }

    void eraseInLinearizedIfNeeded(std::vector<Value*>& Linearized, Instruction* I) {

      unsigned InstrOpcode = I->getOpcode();

      for (int i = Linearized.size() - 1; i >= 0 && getRank(Linearized[i]) == 0; i--) {
        if (InstrOpcode == Instruction::Add) {
          if (dyn_cast<ConstantInt>(Linearized[i])->isZero())
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::FAdd) {
          if (dyn_cast<ConstantFP>(Linearized[i])->isZero())
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::Mul) {
          ConstantInt* CI = dyn_cast<ConstantInt>(Linearized[i]);
          if (CI->isZero()) {
            toRemoveAllOperands(Linearized);
            Linearized.clear();
            break;
          }
          else if (CI->isOne())
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::FMul) {
          ConstantFP* CF = dyn_cast<ConstantFP>(Linearized[i]);
          if (CF->isZero()) {
            toRemoveAllOperands(Linearized);
            Linearized.clear();
            break;
          }
          else if (CF->isExactlyValue(1.0))
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::And) {
          ConstantInt* CI = dyn_cast<ConstantInt>(Linearized[i]);
          if (CI->isZero()) {
            toRemoveAllOperands(Linearized);
            Linearized.clear();
            break;
          }
          else if (CI->isMinusOne())
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::Or) {
          ConstantInt* CI = dyn_cast<ConstantInt>(Linearized[i]);
          if (CI->isMinusOne()) {
            toRemoveAllOperands(Linearized);
            Linearized.clear();
            Linearized.push_back(CI);
            break;
          }
          else if (CI->isZero())
            Linearized[i] = nullptr;
        }
        else if (InstrOpcode == Instruction::Xor) {
          if (dyn_cast<ConstantInt>(Linearized[i])->isZero())
            Linearized[i] = nullptr;
        }
      }

      Linearized.erase(std::remove(Linearized.begin(), Linearized.end(), nullptr), Linearized.end());

    }

  void linearize(Instruction *I, std::vector<Value *> &Linearized) {
    if (std::find(InstructionsToRemove.begin(), InstructionsToRemove.end(), I) == InstructionsToRemove.end())
      InstructionsToRemove.push_back(I);

    unsigned InstrOpcode = I->getOpcode();
    BinaryOperator *BO = dyn_cast<BinaryOperator>(I);

    Value *L = BO->getOperand(0);
    Value *R = BO->getOperand(1);

    BinaryOperator *BO1 = dyn_cast<BinaryOperator>(L);
    BinaryOperator *BO2 = dyn_cast<BinaryOperator>(R);

    bool CanGoDeeperLeft = BO1 && BO1->getOpcode() == InstrOpcode;
    bool CanGoDeeperRight = BO2 && BO2->getOpcode() == InstrOpcode;

    if (!CanGoDeeperLeft && !CanGoDeeperRight) {
      Linearized.push_back(L);
      Linearized.push_back(R);
    } else if (CanGoDeeperLeft && !CanGoDeeperRight) {
      linearize(BO1, Linearized);
      Linearized.push_back(R);
    } else if (!CanGoDeeperLeft && CanGoDeeperRight) {
      Linearized.push_back(L);
      linearize(BO2, Linearized);
    } else if (CanGoDeeperLeft && CanGoDeeperRight) {
      linearize(BO1, Linearized);
      linearize(BO2, Linearized);
    }
  }

  bool areIdenticalOperands(Value *V1, Value *V2) {
    if (V1 == V2)
      return true;

    if (!isa<Instruction>(V1) || !isa<Instruction>(V2))
      return false;

    Instruction *I1 = cast<Instruction>(V1);
    Instruction *I2 = cast<Instruction>(V2);

    if (I1->getOpcode() != I2->getOpcode())
      return false;

    if (LoadInst *L1 = dyn_cast<LoadInst>(I1)) {
      LoadInst *L2 = cast<LoadInst>(I2);
      return L1->getPointerOperand() == L2->getPointerOperand();
    }

    if (CallInst *C1 = dyn_cast<CallInst>(I1)) {
      CallInst *C2 = cast<CallInst>(I2);
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

  bool isCallSafe(CallInst* CI) {

    Function* F = CI->getCalledFunction();

    if (F->isDeclaration()) {

      if (CI->mayHaveSideEffects())
        return false;

      for (Value* V : CI->operands())
        if (!isSafe(V))
          return false;

      return true;
    }

    for (BasicBlock& BB: *F) {
      for (Instruction& I : BB) {
        if (StoreInst* SI = dyn_cast<StoreInst>(&I)) {
          Value* Ptr = SI->getPointerOperand()->stripPointerCasts();
          if (!isa<AllocaInst>(Ptr))
            return false;
        }

        if (CallInst* CI = dyn_cast<CallInst>(&I))
          if (!isCallSafe(CI))
            return false;
      }
    }

    return true;
  }

  bool isSafe(Value* V) {

    Instruction* I = dyn_cast<Instruction>(V);

    if (!I)
      return true;

    if (CallInst *CI = dyn_cast<CallInst>(I))
      return isCallSafe(CI);

    for (Value* Op : I->operands())
      if (!isSafe(Op))
          return false;

    return true;
  }

  void mergeSameOperandsToMul(std::deque<Value *> &Linearized, unsigned Opcode) {
    if (Opcode != Instruction::Add && Opcode != Instruction::FAdd)
      return;

    int numOfConsts = 0;

    for (int i = Linearized.size() - 1; i >= 0 && getRank(Linearized[i]) == 0; i--) {
      numOfConsts++;
    }

    int size = Linearized.size() - numOfConsts;

    std::vector<bool> toRemove(size, false);
    std::vector<unsigned> isRepresentative(size, 0);

    for (int i = 0; i < size && getRank(Linearized[i]) != 0; i++) {
      if (!isSafe(Linearized[i]))
        continue;
      for (int j = i + 1; j < size && getRank(Linearized[i]) == getRank(Linearized[j]); j++) {
        if (areIdenticalOperands(Linearized[i], Linearized[j]) && isRepresentative[j] == 0 && toRemove[j] == false) {
          if (isRepresentative[i] == 0)
            isRepresentative[i] += 2;
          else
            isRepresentative[i]++;
          toRemove[j] = true;
        }
      }
    }

    std::vector<Value *> Concat;

    for (int i = 0; i < isRepresentative.size(); i++) {
      if (isRepresentative[i] > 1) {
        Instruction *I = dyn_cast<Instruction>(Linearized[i]);
        if (Opcode == Instruction::Add) {
          ConstantInt *Multiplier = ConstantInt::get(Type::getInt32Ty(I->getContext()), isRepresentative[i]);
          BinaryOperator *Mul = BinaryOperator::Create(Instruction::Mul, Linearized[i], Multiplier, "", I->getNextNode());
          Concat.push_back(Mul);
        }
        if (Opcode == Instruction::FAdd) {
          Constant *Multiplier = ConstantFP::get(Type::getDoubleTy(I->getContext()), (double)isRepresentative[i]);
          BinaryOperator *FMul = BinaryOperator::Create(Instruction::FMul, Linearized[i], Multiplier, "", I->getNextNode());
          Concat.push_back(FMul);
        }
      }
    }

    for (int i = 0; i < toRemove.size(); i++) {
      Instruction *I = dyn_cast<Instruction>(Linearized[i]);
      if (toRemove[i]) {
        toRemoveToBottom(I);
        Linearized[i] = nullptr;
      }
      if (isRepresentative[i] > 1) {
        Linearized[i] = nullptr;
      }
    }

    Linearized.erase(std::remove(Linearized.begin(), Linearized.end(), nullptr), Linearized.end());

    for (Value *V : Concat)
      Linearized.push_front(V);

    Concat.clear();
  }

  void processInstruction(Instruction *I, std::vector<Value *> &Linearized) {
    std::stable_sort(Linearized.begin(), Linearized.end(), [this](Value *A, Value *B) {
      return getRank(A) > getRank(B);
    });

    std::deque<Value *> d(Linearized.begin(), Linearized.end());
    mergeSameOperandsToMul(d, I->getOpcode());
    Linearized.clear();
    Linearized.assign(d.begin(), d.end());
    d.clear();

    eraseInLinearizedIfNeeded(Linearized, I);

    Value* LinearizedConstResult = nullptr;
    Value* LinearizedNotConstResult = nullptr;

    if (!Linearized.empty()) {
      if (isa<Constant>(Linearized.back())) {
        LinearizedConstResult = Linearized.back();
        for (int i = Linearized.size() - 2; i >= 0 && getRank(Linearized[i]) == 0; i--) {
          Constant *C1 = dyn_cast<Constant>(LinearizedConstResult);
          Constant *C2 = dyn_cast<Constant>(Linearized[i]);
          LinearizedConstResult = ConstantExpr::get(I->getOpcode(), C1, C2);
        }
      }

      if (!isa<Constant>(Linearized[0])) {
        LinearizedNotConstResult = Linearized[0];
        for (int i = 1; i < Linearized.size() && getRank(Linearized[i]) != 0; i++) {
          LinearizedNotConstResult = BinaryOperator::Create(
          static_cast<Instruction::BinaryOps>(I->getOpcode()), LinearizedNotConstResult, Linearized[i], "", I);
        }
      }
    }

    Value* FinalResult = nullptr;

    if (LinearizedNotConstResult && LinearizedConstResult)
      FinalResult = BinaryOperator::Create(static_cast<Instruction::BinaryOps>(I->getOpcode()), LinearizedNotConstResult,
        LinearizedConstResult, "", I);
    else if (LinearizedNotConstResult)
      FinalResult = LinearizedNotConstResult;
    else if (LinearizedConstResult)
      FinalResult = LinearizedConstResult;
    else {
      Type* InstrType = I->getType();
      FinalResult = Constant::getNullValue(InstrType);
    }

    I->replaceAllUsesWith(FinalResult);
  }

  void replaceFMulAddCalls(Function *F) {
    std::vector<CallInst *> FMulAddCalls;
    for (BasicBlock &BB : *F) {
      for (Instruction &I : BB) {
        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
          if (Function *Callee = CI->getCalledFunction()) {
            if (Callee->getName().find("llvm.fmuladd.f64") == 0)
              FMulAddCalls.push_back(CI);
          }
        }
      }
    }

    for (CallInst *CI : FMulAddCalls) {
      Value *MulLeftOperand = CI->getOperand(0);
      Value *MulRightOperand = CI->getOperand(1);
      Value *AddOperand = CI->getOperand(2);

      // Konstruise dve instrukcije tipa BinaryOperator od jedne instrukcije %i
      // = call fmuladd.f64(a, b, c) Prvo konstruise instrukcija koja mnozei a i
      // b, tj. operande 0 i 1. A zatim konstruise drugu instrukciju na primer
      // %k = fadd %p, 2. Gde dva predstavlja drugu operandu u izrazu a * b + c.
      BinaryOperator *Mul = BinaryOperator::Create(Instruction::FMul, MulLeftOperand, MulRightOperand, "", CI);
      BinaryOperator *Add = BinaryOperator::Create(Instruction::FAdd, Mul, AddOperand, "", CI);

      // Zamenjuje svuda pojavljivanje %i sa %k jer %k sada predstavlja vrednost
      // izraza
      CI->replaceAllUsesWith(Add);
      // Brise instrukciju iz BasicBlock-a (parent-a)
      CI->eraseFromParent();
    }
  }
  void StrengthReduction(Function &F) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        if (std::find(InstructionsToRemove.begin(), InstructionsToRemove.end(), &I) != InstructionsToRemove.end())
          continue;
        if (I.use_empty())
          continue;

        if (I.getOpcode() == Instruction::Mul) {
          Value *Op0 = I.getOperand(0);
          Value *Op1 = I.getOperand(1);

          ConstantInt *CI = dyn_cast<ConstantInt>(Op1);
          Value *VariableOp = Op0;

          if (!CI) {
            CI = dyn_cast<ConstantInt>(Op0);
            VariableOp = Op1;
          }

          if (CI) {
            APInt Val = CI->getValue();
            if (Val.isPowerOf2() && Val.getZExtValue() > 1) {
              unsigned ShiftAmount = Val.logBase2();
              Value *ShiftConst = ConstantInt::get(CI->getType(), ShiftAmount);

              Instruction *Shl = BinaryOperator::Create(
                  Instruction::Shl, VariableOp, ShiftConst, "", &I);

              I.replaceAllUsesWith(Shl);
              InstructionsToRemove.push_back(&I);
            }
          }
        } else if (CallInst *Call = dyn_cast<CallInst>(&I)) {
          Function *Callee = Call->getCalledFunction();
          if (Callee && (Callee->getIntrinsicID() == Intrinsic::pow || Callee->getName() == "pow" || Callee->getName() == "powf") &&
              Callee->arg_size() == 2) {
            Value *Base = Call->getArgOperand(0);
            Value *Exponent = Call->getArgOperand(1);

            if (ConstantFP *CFP = dyn_cast<ConstantFP>(Exponent)) {
              double Exp = CFP->getValueAPF().convertToDouble();

              unsigned N = static_cast<unsigned>(Exp);

              Value *Replacement = nullptr;

              if (N == 0) {
                Replacement = ConstantFP::get(Base->getType(), 1.0);
              } else if (N == 1) {
                Replacement = Base;
              } else {
                Replacement = Base;

                for (unsigned i = 1; i < N; ++i) {
                  Replacement =
                      BinaryOperator::CreateFMul(Replacement, Base, "", Call);
                }
              }

              Call->replaceAllUsesWith(Replacement);
              InstructionsToRemove.push_back(Call);
            }
          }
        }
      }
    }
  }

  OurReassociateExpressionsPass() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override {

    RankMap.clear();
    RootsToProcess.clear();
    InstructionsToRemove.clear();

    replaceFMulAddCalls(&F);

    for (BasicBlock &BB : F)
      for (Instruction &I : BB) {
        assignRankToInstr(&I);

        if (isSuitableOperation(&I) && isRoot(dyn_cast<BinaryOperator>(&I)))
          RootsToProcess.push_back(&I);
      }

    for (Instruction *I : RootsToProcess) {
      std::vector<Value *> Linearized;
      linearize(I, Linearized);
      processInstruction(I, Linearized);
    }

    StrengthReduction(F);

    for (auto it = InstructionsToRemove.rbegin(); it != InstructionsToRemove.rend(); it++)
      (*it)->eraseFromParent();

    return true;
  }
};
}

char OurReassociateExpressionsPass::ID = 0;
static RegisterPass<OurReassociateExpressionsPass>X("our-reassociate-expressions", "");
