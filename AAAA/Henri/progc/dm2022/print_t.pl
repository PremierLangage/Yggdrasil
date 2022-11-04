extends = dm_base.pl

title = Affichage d'un plateau

text ==
Afficher une grille
==

student_source = print_t

editor.code == #|c|
void print_t(int h, int *t[], int l) {
    
}
==

code_before == #|c|
#include <stdio.h>
==

sources.main == #|c|
#include <stdlib.h>

#include "print_t.h"
#include "random_t.h"

int main(int argc, char *argv[]) {
    int h = 9, l = 10;
    long seed = strtol(argv[1], NULL, 10);
    srandom(seed);
    int **t = random_t(h, l, rand() % 10 + 5);
    print_t(h, t, l);
    // free_t(h, t);
    return 0;
}
==


checks_args_stdin==#|python|
[["Test basique", ["12"], ""],
["Test encore ", ["42"], ""]
]
==