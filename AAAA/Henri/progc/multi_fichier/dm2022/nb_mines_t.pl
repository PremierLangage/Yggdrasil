extends = dm_base.pl

title = Nombre de mines voisines

text ==#|markdown|
Écrire une function `nbmines_t` qui prend

- un entier représentant la hauteur du terrain
- un entier représentant la largeur
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)
- un entier i
- un entier j

et qui retourne le nombre de mines sur les 8 cases adjacente de la case de coordonées i,j
avec le terrain suivant on a  

    nbmines(...,0,1)-> 1  
    nbmines(...,1,1)-> 2  
    nbmines(...,2,2)-> 0  
    nbmines(...,0,2)-> 1 ne pas compter la mine en 0,2

    0 0 9 9 0 9 0 0 0 0  
    0 2 0 3 0 0 0 0 0 0  
    0 1 9 0 0 0 0 0 0 0  
    0 0 0 0 0 0 0 0 9 9  
    0 0 0 0 0 0 0 0 9 0  
    0 0 0 0 0 0 0 0 0 0  

Rappel: on réalise un [Démineur (genre de jeu vidéo)](https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o))

Remarque: On peut utiliser la fonction `has_mine_t` ....
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
    puts("Nombre de mines vues depuis chaque case");
    for (int i = 0; i < h; i++) {
        for (int j = 0; j < l; j++) {
            printf("%d ", nb_mines_t(h, l, t, i, j));
        }
        printf("\n");
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
