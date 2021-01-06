#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Afficher le contenu d'un tableau
tag=array|affichage|tableau|fonction

editor.height=280px

text==#|markdown|
Écrire une fonction qui affiche le contenu d'un tableau d'entiers C. Cette
fonction prendra en paramèrtre un tableau d'entiers ainsi que le
nombre d'éléments contenus dans ce tableau. On commencera l'affichage 
avec un crochet ouvrant, puis les entiers séparés par une virgule 
s'ils sont plusieurs et enfin un crochet fermant en fin de tableau. 
Ne pas mettre de retour chariot en fin d'affichage. Les virgules, quand 
elles existent, sont suivies d'un espace.


<pre>
1,2,3,4 --> [1, 2, 3, 4]   
5       --> [5]   
rien    --> []
</pre>

==

code_before==

==

code_after==#|c|

#include <stdlib.h>

int main(int argc, char* argv[]){
  int* tab=malloc(argc*sizeof(int));
  int i;

  for(i=0 ; i<argc-1 ; i++)
    tab[i] = atoi(argv[i+1]);

  display_array(tab, argc-1);
  return 0;
}
==

editor.code==
#include ...

void display_array(int* array, int nb_term){
  /* votre code ici... */
}
==

solution==#|c|
#include <stdio.h>

void display_array(int* array, int nb_term){
  int i;

  if (nb_term == 0){
    printf("[]");
    return ;
  }
  printf("[");
  for (i=0 ; i<nb_term-1 ; i++)
    printf("%d, ", array[i]);
  printf("%d]", array[nb_term-1]);
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1", "2", "3", "4"], ""],
 ["Tableau singleton", ["42"], ""],
 ["Tableau vide", [], ""],
 ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(0, 10))], ""],
 ["Test aléatoire 2", [str(randint(-100, 100)) for i in range(randint(0, 10))], ""],
 ["Test aléatoire 3", [str(randint(-100, 100)) for i in range(randint(0, 10))], ""],
 ["Test aléatoire 4", [str(randint(-100, 100)) for i in range(randint(0, 10))], ""]]
==




