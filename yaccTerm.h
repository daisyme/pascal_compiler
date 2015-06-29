#include <string>
#define INTEGER 0
#define REAL 1
#define CHAR 2
#define BOOLEAN 3
#define STRING 4
#define MAXINT 32767
//sys_funct	["abs" | "chr" | "odd" | "ord" | "pred" | "sqr" | "sqrt" | "succ"]
//0-7
int sys_funct;
std::string id;

typedef union {
    int iVal;
	float rVal;
	char cVal;
	bool bVal;
	std::string* sVal;
}val;

typedef struct{
	int t;		
	int size;
	type* child;
}type;

typedef struct {
    type* Type;
    std::string* Name;
    Val Value;
    bool _calculable;
    ConteneurCode* _code;
} expression;