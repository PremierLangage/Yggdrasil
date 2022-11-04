extends = dm_base.pl

title = Affichage d'un plateau

text ==
Afficher une grille
==

student_source = nb_mines_t

editor.code == #|c|
int nb_mines_t(int h, int l, int *t[], int i, int j) {
    
}
==

code_before == #|c|
#include "has_mine_t.h"
==

# Main de test pour print_t
sources.main == #|c|
#include <stdio.h>
#include <stdlib.h>

#include "print_t.h"
#include "random_t.h"

int main(int argc, char *argv[]) {
    int h = 9, l = 10;
    long seed = strtol(argv[1], NULL, 10);
    srandom(seed);
    int **t = random_t(h, l, rand() % 10 + 10);
    printf("Dans la grille:\n");
    print_t(h, t, l);
    puts("");

    int test[][2] = {
        { 0, 0 },
        { h-1, l-1 },
        { 0, l-1 },
        { h-1, 0 },
        { 2, 4 }
    };
    for (int i = 0; i < sizeof(test) / sizeof(test[0]); i++) {
        printf("nb_mines_t(9, 10, grille, %d, %d): %d\n", 
            test[i][0], test[i][1], 
            nb_mines_t(h, l, t, test[i][0], test[i][1])
        );
    }

    // free_t(h, t);
    return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["12"], ""],
["Test encore ", ["42"], ""]
]
==
