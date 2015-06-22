#include <string>
#define INTEGER 0
#define REAL 1
#define CHAR 2
#define BOOLEAN 3
#define STRING 4

struct ConstValue {
	int type;
	int intValue;
	float realValue;
	char charValue;
	bool boolValue;
	std::string strValue;
}

