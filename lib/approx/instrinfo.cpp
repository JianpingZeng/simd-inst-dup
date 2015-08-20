#include "approximate.hxx"
using namespace llvm;
instrInfo::instrInfo(Instruction* cInstr){
  minstr = cInstr;
  misDuplicated = false;
  mduplicatedBy = NULL;
  misVar = false;
  misVecInst = false;
  misSSEInst = false;
  misAVXInst = false;
  misInstrumented = false;
  misReplaced = false;
  lastUses = 0;
}

