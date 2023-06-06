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

title=Somme des éléments positifs d'un tableau
tag=tableau|parcours|condition

text==

Écrire une fonction C **sum_of_positives** qui prend en paramètre un
tableau d'entiers ansi que son nombre d'éléments. La fonction
retournera la somme des éléments positifs contenus dans le tableau. Il ne faut 
donc pas ajouter les négatifs s'il y en a.

<br />
==

editor.height = 500px
editor.code==
... sum_of_positives(...){
    /* Votre code ici */
}
==

solution==#|c|
int sum_of_positives(int* tab, int taille){
  int i;
  int somme=0;

  for (i=0 ; i<taille ; i++){
    if (tab[i] > 0)
      somme += tab[i];	  
  }
  
  return somme;
}
==

code_before==

==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));
  int i;

  for (i=0 ; i<nb_term ; i++){
    tab[i] = atoi(argv[i+1]);
  }

  printf("Somme des positifs : %d\n", sum_of_positives(tab, nb_term));
  free(tab);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Exécution simple", ["1"], ""],
  ["Quelques éléments", ["12", "-3", "52", "0", "41"], ""],
  ["Tableau vide", [], ""],
  ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 2", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 3", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 4", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 5", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""] ]
==

