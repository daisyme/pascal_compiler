#include "symbolTable.h"

using namespace std;

void SymbolTable::enterNewScope() {
    table.push_back(map <string, SymbolElement> ());
}

void SymbolTable::exitScope() {
    table.pop_back();
}

void SymbolTable::addSymbol(string name, SymbolElement val) {
    if (table.back().count(name)) {
        throw ALREADY_EXIST;
    } else {
        table.back()[name] = val;
    }
}

SymbolElement SymbolTable::findSymbol(string name) {
    for (int i = (int)(table.size()) - 1; i >= 0; i--) {
        if (table[i].count(name)) {
            return table[i][name];
        }
    }
    throw DO_NOT_EXIST;
}
