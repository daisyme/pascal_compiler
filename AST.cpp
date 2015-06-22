#include "AST.h"

void AST::addChild(AST *node) {
    child.push_back(node);
}
