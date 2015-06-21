#ifndef _UTIL_H_
#define _UTIL_H_

#include <vector>
#include <string>

/*
CommandList
    * A vector of string.
    * +, += to concat
*/


struct CommandList {
    std::vector <std::string> cl;

    CommandList();

    CommandList(const std::string &command);

    CommandList(const std::vector <std::string> &cl);

    CommandList operator + (const CommandList &oth) const;

    CommandList & operator += (const CommandList &oth) ;
};

#endif
