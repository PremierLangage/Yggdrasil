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

title=Élément le plus présent d'un tableau
tag=tableau|parcours|occurrence|comptage

text==

Écrire une fonction C **most_present** qui prend en paramètre un
tableau d'entiers ansi que son nombre d'éléments. La fonction
devra retourner l'élément le plus souvent présent dans le 
tableau. Si plusieurs éléments apparaissent le plus souvent, alors 
votre fonction devra retourner le plus petit parmi les éléments 
les plus souvent présents.

Par souci de simplicité, les éléments seront toujours des entiers 
compris entre **0** et **49** tout deux inclus. Si le tableau est 
vide, votre fonction devra retourner **-1**.

<br />
==

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
  ["Quelques éléments", ["12", "3", "40", "5", "41"], ""],
  ["Tableau vide", [], ""],
  ["Quelques éléments", ["2", "1", "2", "1", "2", "1"], ""],
  ["Test aléatoire 1", [str(randint(1, 5)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 2", [str(randint(1, 5)) for i in range(randint(5, 10))], ""],
  ["Test aléatoire 3", [str(randint(1, 5)) for i in range(randint(10, 15))], ""],
  ["Test aléatoire 4", [str(randint(1, 5)) for i in range(randint(10, 15))], ""],
  ["Test aléatoire 5", [str(randint(1, 5)) for i in range(randint(15, 20))], ""],
  ["Test aléatoire 6", [str(randint(1, 49)) for i in range(randint(50, 200))], ""],
  ["Test aléatoire 7", [str(randint(1, 49)) for i in range(randint(50, 200))], ""] ]
==


