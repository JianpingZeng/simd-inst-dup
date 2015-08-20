/*
 * Author: Daya S Khudia (dskhudia@umich.edu)
 */

#define DEBUG_TYPE "helper"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "helper.hxx"
using namespace llvm;

STATISTIC(HelperCounter, "Counts number of functions greeted");

char Helper::ID = 0;
static RegisterPass<Helper> X("helper", "helper Pass");

bool Helper::runOnFunction(Function &F){
  ++HelperCounter;
  errs() << "Helper: ";
  errs().write_escaped(F.getName()) << '\n';
  return false;
}


