#include "object.h"
#include "nosh.tab.h"
#include <stdio.h>

int main(void) {
    initialObject();
    printf("? ");
    yyparse();
}
