#include "util.h"
using namespace std;

CommandList::CommandList(): cl(vector <string> ()) {
}

CommandList::CommandList(const string &command): cl(vector <string> ()) {
    cl.push_back(command);
}

CommandList::CommandList(const std::vector <string> &cl): cl(cl) {
}

CommandList CommandList::operator + (const CommandList &oth) const {
    CommandList res;
    res += *this;
    res += oth;
    return res;
}

CommandList & CommandList::operator += (const CommandList &oth) {
    for (const string &u : oth.cl) {
        cl.push_back(u);
    }
    return *this;
}
