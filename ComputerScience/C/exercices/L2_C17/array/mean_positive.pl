#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Moyenne des éléments positifs

tag=fonction|tableau|type|conditionnelle

editor.height=300px

text==
Écrire une fonction C **mean_positive** qui prend en argument un tableau d'entiers 
**array** ainsi que sa taille **size**. Votre fonction devra retourner la moyenne
des éléments positifs ou nuls contenus dans le tableau. Cette moyenne devra être
calculée et retournée dans les floattants C. Si le tableau ne contient aucun 
élément positif ou nul, votre fonction devra alors retourner zéro (dans les 
flottants toujours).
==

checks_args_stdin==#|python|
[["Exemple simple", ["1", "2", "3"], ""],
 ["Tableau vide", [], ""],
 ["Que des négatifs", ["-1", "-1", "-321"], ""],
 ["Mélange de valeurs non nulles", ["-1", "3", "1", "-12", "2"], ""],
 ["Mélange de valeurs avec des zéros", ["-1", "3", "0", "1", "-12", "2", "0", "-3", "0"], ""],
 ["Test aléatoire 1", [str(randint(-100,100)) for i in range(randint(5, 10))], ""],
 ["Test aléatoire 2", [str(randint(-100,100)) for i in range(randint(11, 15))], ""],
 ["Test aléatoire 3", [str(randint(-100,100)) for i in range(randint(16, 20))], ""] ]
==

editor.code==#|c|
... mean_positive(int* array, int size){
  /* Votre code ici... */
  return ...
}
==

solution==#|c|
float mean_positive(int* array, int size){
  int i;
  int nb=0;
  float sum = 0.0;

  for (i=0 ; i<size ; i++){
    if (array[i] >= 0){
      sum += array[i];
      nb += 1;
    }
  }
  if (nb > 0)
    return sum / nb;
  return 0.0;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int* array=NULL;
  int i;

  array = (int*)malloc(sizeof(int) * argc);
  for (i=1 ; i<argc ; i++)
    array[i] = atoi(argv[i]);

  printf("mean_positive( [");
  for (i=1 ; i<argc-1 ; i++)
    printf("%d, ", array[i]);
  if (argc > 0)
    printf("%d", array[argc-1]);
  printf("] ) : %f", mean_positive(array, argc-1));

  return 0;
}
==

