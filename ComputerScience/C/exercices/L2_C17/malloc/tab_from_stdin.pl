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

author=Nicolas Borie

title=Allocation d'un tableau d'entier donné au clavier
tag=tableau|malloc|scanf|entier|clavier

editor.height=350px

text==#|markdown|
Écrire une fonction **make_and_fill_array** prenant en argument un pointeur vers un entier. Votre
fonction devra lire l'entrée standard (c'est à dire le clavier) durant son 
exécution avec **scanf** par exemple. L'entrée standard commencera toujours
par un entier positif ou nul. Une fois cet entier connu, vous devrez mettre à 
jour la valeur pointée par le pointer en argument. vous devrez ensuite allouer de 
la place mémoire pour un tableau pouvant contenir autant d'entiers.


À la suite de cet entier donnant une taille `n`, il y aura systématiquement 
autant d'entiers qui suivent sur l'entrée standard (l'utilisateur devra toujours 
les taper sur son clavier).


Voici, par ligne, quelques exemples d'entrée standard possibles :

    ~$> 0
    ~$> 1 42
    ~$> 2 -8 -35
    ~$> 5 -12 54 128 -2 7


==

editor.code==#|c|
... make_and_fill_array(int* size){
    // Votre code ici...
}
==

solution==#|c|
int* make_and_fill_array(int* size){
    int* tab = NULL;
    int i;

    scanf(" %d", size);

    tab = (int*)malloc(*size * sizeof(int));
    if (tab == NULL)
        return NULL;
    for (i=0 ; i<*size ; i++){
        scanf(" %d", &(tab[i]));
    }
    return tab;
}
==

code_before==#|c|
#include <stdlib.h>
#include <stdio.h>
==

code_after==#|c|

int main(int argc, char* argv[]){
    int* tab=NULL;
    int size;
    int i;

    tab = make_and_fill_array(&size);
    putchar('[');
    for (i=0 ; i<size ; i++){
        printf("%d", tab[i]);
        if (i < (size-1)){
            putchar(','); putchar(' ');
        }
    }
    putchar(']'); putchar('\n');
    free(tab);

  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", [], "1 42"],
 ["Tableau vide", [], "0"],
 ["Tableau moyen", [], "5 -12 54 128 -2 7"],
 ["Test aléatoire 1", [], str(randint(5, 10))+" "+" ".join([str(randint(-10, 10)) for i in range(10)]) ],
 ["Test aléatoire 2", [], str(randint(5, 10))+" "+" ".join([str(randint(-100, 100)) for i in range(10)]) ],
 ["Test aléatoire 3", [], str(randint(10, 15))+" "+" ".join([str(randint(-10, 10)) for i in range(15)]) ],
 ["Test aléatoire 4", [], str(randint(10, 15))+" "+" ".join([str(randint(-100, 100)) for i in range(15)]) ],
 ["Test aléatoire 5", [], str(randint(15, 20))+" "+" ".join([str(randint(-100, 100)) for i in range(20)]) ], ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

