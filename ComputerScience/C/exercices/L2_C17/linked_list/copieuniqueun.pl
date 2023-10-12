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


title= Copie Unique 

tag=string|malloc|structure|recopiage|cellule|liste

editor.height=350px

text==#|markdown|
ON suppose l'existance d'une fonction **ajoutSansDoublons** qui prend en argument une Liste\* l(voir éditeur) et un Maillon* new. 
Et qui ajoute à la fin de la liste l si le maillon new si la valeur n'est pas déjà présente.

Ecrire une fonction **Liste copieUniqueUn(Liste l)** qui créer une copie de la liste **l** où chaque élément n'apparait qu'une seule fois. 


==

editor.code==#|c|
#include <stdlib.h>
#include <stdio.h>

// ne pas modifier 
typedef struct _maillon {
    int valeur;
    struct _maillon *suivant;
} *Liste,Maillon;
// les types

Liste copieUniqueUn(Liste l){
  // Votre code ici...
}

// NE PAS ECRIRE LA FONTION ajoutSansDoublons !! 

==

solution==#|c|

Liste copieUniqueUn(Liste l){
    Liste K=NULL;
    for(;l; l = l->suivant)
    {
     Liste new=malloc(sizeof(Maillon)); 
     new->valeur = l->valeur;
     ajoutSansDoublons(&K,new);
    }
    return *k;
}

==

code_before==#|c|
#define _DEFAULT_SOURCE

#include <stdlib.h>
#include <stdio.h>

typedef struct _maillon {
    int valeur;
    struct _maillon *suivant;
} *Liste,Maillon;

Maillon *ajoutSansDoublons(Liste *l, Maillon *new){
    if (*l == NULL) { new->suivant = *l;*l = new;  return NULL;}
    else if ((*l)->valeur == new->valeur) return new;
    else return ajoutSansDoublons(&((*l)->suivant),new);
}

==

code_after==#|c|
void affiche(Liste l){
    while (l != NULL){
        printf("%d ",l->valeur);
        l = l->suivant;
    }
    printf("\n");
}


int main(int n, char **v){
    Liste l = NULL;
    while (scanf("%d",&n) != EOF){
        Maillon *m = malloc(sizeof(Maillon));
        m->valeur = n;
        ajoutSansDoublons(&l,m);
    }
    affiche(l);
}

==

checks_args_stdin==#|python|
[["Exécution simple", [], "1 2 3 4 5 6 7 8 9 0 1111 22 3 7 6 5 4 3 2 1 1 1 "],
["Exécution pas plus dur mais aléatoire", ""," ".join([str(randint(0,50)) for i in range(1000)])],
["Une autre Exécution", ""," ".join([str(randint(0,50)) for i in range(1000)])]
]
==





