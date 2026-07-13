add_llvm_library( LLVMOurReassociateExpressionsPass MODULE
  OurReassociateExpressionsPass.cpp

  PLUGIN_TOOL
  opt
  )
