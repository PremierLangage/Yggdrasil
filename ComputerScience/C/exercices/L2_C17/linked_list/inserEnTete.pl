#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Dominique Revuz 


title= Insertion en Tête de liste 

tag=string|malloc|structure|recopiage|cellule|liste

editor.height=350px

text==#|markdown|
Écrire une fonction **insereEnTete** qui prend en argument une **Liste\*** l(voir éditeur) et un **Maillon\*** new. 

Qui insère en tête le maillon `new` dans la liste `l`. 


==

editor.code==#|c|
#include <stdlib.h>
#include <stdio.h>

// ne pas modifier 
typedef struct _maillon {
    int valeur;
    struct _maillon *suivant;
} *List,Maillon;
// les types

void insereEntete(List *l, Maillon *new){
  // Votre code ici...
}
==

solution==#|c|


#include <stdlib.h>
#include <stdio.h>

typedef struct _maillon {
    int valeur;
    struct _maillon *suivant;
} *List,Maillon;

void insereEnTete(List *l, Maillon *new){
    new->suivant = *l;
    *l = new;
}

==

code_before==#|c|
#define _DEFAULT_SOURCE
==

code_after==#|c|
void affiche(List l){
    while (l != NULL){
        printf("%d ",l->valeur);
        l = l->suivant;
    }
    printf("\n");
}


int main(int n, char **v){
    List l = NULL;
    while (scanf("%d",&n) != EOF){
        Maillon *m = malloc(sizeof(Maillon));
        m->valeur = n;
        insereEnTete(&l,m);
    }
    affiche(l);
}

==

checks_args_stdin==#|python|
[["Exécution simple", [], "1 2 3 4 5 6 7 8 9 0 1111"],
["Exécution pas plus dur mais aléatoire", ""," ".join([str(randint(0,50)) for i in range(10)])],
["Une autre Exécution", ""," ".join([str(randint(0,50)) for i in range(10)])]
]
==





