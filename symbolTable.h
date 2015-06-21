#ifndef _SYMBOL_H_
#define _SYMBOL_H_
#include <vector>
#include <map>
#include "info.h"
#include "const.h"

struct SymbolEelement {
    int type; //0 for var, 1 for procedure, 2 for function
    VarInfo vinfo;
    FuncInfo finfo;
    ProcInfo pinfo;
};

struct SymbolTable {
    std::vector < std::map <std::string, SymbolEelement> > table;

    void enterNewScope();

    void exitScope();

    void addSymbol(std::string, SymbolEelement); //throw ALREADY_EXIST exception

    SymbolEelement findSymbol(std::string); //throw DO_NOT_EXIST exception
};

#endif
