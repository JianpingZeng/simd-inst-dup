//This file is currently not distributed under any license. Happy?
//
#ifndef LLVM_TRANSFORMS_VPINSTRUMENTATION_H
#define LLVM_TRANSFORMS_VPINSTRUMENTATION_H

#include "llvm/IR/DataLayout.h"
namespace llvm {

  class ModulePass;
  /*class FunctionPass;*/
  /*class LoopPass;*/

  //Count the number of instructions
  ModulePass* createInstCounter();

  FunctionPass *createVPProfilerPass();

  /*LoopPass *createLAMPLoopProfilerPass();*/

  ModulePass *createVPInitPass();

  class VPProfiler : public FunctionPass {
    Constant* vpFuncs[5];
    virtual bool runOnFunction(Function &F);
    void createVPDeclarations(Module &M);

    public:
    static uint64_t instr_id;
    static char ID;
    static DataLayout* TD;
    static int getSize(Type* ty);
    virtual void getAnalysisUsage(AnalysisUsage &AU) const{
      AU.addRequired<DataLayout>();
    }
    VPProfiler() : FunctionPass(ID){
      vpFuncs[0] = NULL;
      TD = NULL;
    }
  };
}

#endif
