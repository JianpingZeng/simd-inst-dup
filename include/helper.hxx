/*
 * Author: Daya S Khudia (dskhudia@umich.edu)
 */
#ifndef HELPER_H
#define HELPER_H

#include "llvm/Pass.h" 
#include "llvm/IR/Function.h"
using namespace llvm;
namespace {

class Helper:public FunctionPass{
public:
  static char ID;
  Helper() : FunctionPass(ID) {}
  virtual bool runOnFunction(Function &F);
private:
};

}
#endif
