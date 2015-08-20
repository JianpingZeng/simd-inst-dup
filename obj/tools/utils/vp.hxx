//this is for the value profiling
#ifndef VALUE_PROFILING_H
#define VALUE_PROFILING_H

#include <inttypes.h>
#include <iostream>
#include <ostream>

#include <map>
#include <vector>
#include <set>
#include <iterator>
#include <limits>

using namespace std;

#define MAX_VALUES 9
#define HALFSIZE MAX_VALUES / 2
#define HISTSIZE 5

namespace VP {

  class ValueCount{
  public:
    int value;
    uint32_t count;
    ValueCount() : count(0) {}
  };

  class histData{
  public:
    histData() : count(0) {
      lowerRange = numeric_limits<int>::max();
      upperRange = numeric_limits<int>::max(); 
    }
    int getLowerRange() const {
      return lowerRange;
    }
    int getUpperRange() const {
      return upperRange;
    }
    void setLowerRange(int aValue){
      lowerRange = aValue;
    }
    void setUpperRange(int aValue){
      upperRange = aValue;
    }
    uint64_t getCount() const{
      return count;
    }
    void incrementCount(){
      count++;
    }
    void setCount(const int aCount){
      count = aCount;
    }
  private:
    int lowerRange;
    int upperRange;
    uint64_t count;
  };

  struct compareCls {
    bool operator() (const histData* lhs, const histData* rhs) const{
      return lhs->getLowerRange() < rhs->getLowerRange();
    }
  };

  typedef vector<ValueCount*> valueVec_t;
  typedef set<histData*, compareCls> histSet_t;

  class VProfile {
    private:
      //static const uint32_t MAX_VALUES = 9;
      static uint32_t CLR_INTERVAL;

      //keeps track of values to occurance counts
      valueVec_t valueToExeCount;
      //keeps track of execution count of a particular instruction
      uint64_t exeCount;
      histSet_t histogram;

    public:
      VProfile() : exeCount(0) {
        for(uint32_t i = 0; i < MAX_VALUES; i++){
          valueToExeCount.push_back(new ValueCount());
        }
        histogram.insert(new histData());
          //for(uint32_t i = 0; i < HISTSIZE + 1; i++){
          //}
      }

      void increment(const int value);
      void keep_top_half();
      //histogram
      void addToHistogram(const int value);
      void maintainSize();

      friend ostream &operator<<(ostream &stream, const VProfile &vp);
  };

  ostream &operator<<(ostream &stream, const VProfile &vp) {
    //stream<<vp.exeCount<<" : ";
    //if (vp.exeCount == 0)
    //  return stream;

    //for(uintmap_t::const_iterator I = vp.valueToExeCount.begin();
     //   I != vp.valueToExeCount.end(); I++){
     for(uint32_t i = 0; i < MAX_VALUES; i++){
      if((vp.valueToExeCount[i])->count != 0){
        stream << (vp.valueToExeCount[i])->value << " " << (vp.valueToExeCount[i])->count << " "; 
      }
      else{
        break;
      }
     }
     set<histData*>::iterator it;
     stream << ", ";
     for(it = vp.histogram.begin(); it != vp.histogram.end(); ++it){
       histData* elem = *it;
       if(elem->getCount() != 0){
         stream << elem->getLowerRange() << " " << elem->getUpperRange() << " " << elem->getCount() << " "; 
       }
     }
    return stream;
  }
  uint32_t VProfile::CLR_INTERVAL = 2000;
}

#endif
