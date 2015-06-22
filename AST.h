#ifndef _AST_H_
#define _AST_H_

#include <vector>

struct AST {
    std::vector <AST *> child;

    void addChild(AST *);
    
};

#endif
