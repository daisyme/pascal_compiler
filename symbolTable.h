#ifndef _SYMBOL_H_
#define _SYMBOL_H_
#include <vector>
#include <map>
#include "info.h"
#include "const.h"

struct SymbolElement {
    int type; //0 for var, 1 for procedure, 2 for function
    VarInfo vinfo;
    FuncInfo finfo;
    ProcInfo pinfo;
    ConInfo cinfo;   //constant
    TypeInfo tinfo;
};

struct SymbolTable {
    std::vector < std::map <std::string, SymbolElement> > table;

    void enterNewScope();

    void exitScope();

    void addSymbol(std::string, SymbolElement); //throw ALREADY_EXIST exception

    SymbolElement findSymbol(std::string); //throw DO_NOT_EXIST exception
};

#endif
