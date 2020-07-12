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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie
title=Moyenne des éléments positifs
tag=function|array|type

editor.height=300px

text==
Écrire une fonction C **mean_positive** qui prend en argument un tableau d'entiers 
**array** ainsi que sa taille **size**. Votre fonction devra retourner la moyenne
des éléments positifs ou nuls contenus dans le tableau. Cette moyenne devra être
calculée et retournée dans les floattants C. Si le tableau ne contient aucun 
élément positifs ou nuls, votre fonction devra alors retourner zéro (dans les 
flottants encore).
==

editor.code==#|c|
... mean_positive(int* array, int size){
  /* Votre code ici... */
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

code.before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code.after==#|c|
int main(int argc, char* argv[]){
  int* array=NULL;
  int i;

  array = (int*)malloc(sizeof(int) * (argc-1));
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
