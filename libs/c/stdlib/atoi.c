#include <stdlib.h>
int atoi(const char *str) {
    return ((int)strtol(str,(char **)0,10));
}
