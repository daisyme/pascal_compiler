#ifndef _INFO_H_
#define _INFO_H_

#include <string>
#include <vector>
#include "util.h"

struct VarInfo {
    std::string name;
    long long addr;
    int type;
};

struct FuncInfo {
    std::string name;
    std::vector <VarInfo> augment;
    VarInfo ret;
    CommandList cl;
};

struct ProcInfo {
    std::string name;
    std::vector <VarInfo> augment;
    CommandList cl;
};

struct TypeInfo {
    std::string name;
    int type;
    //
};

struct ConInfo {
    std::string name;
    ConstValue value;
};
#endif
