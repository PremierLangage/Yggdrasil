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
title=Trois nombres impairs d'affilée
tag=function|type|array

# editor.height=300px

text==
Écrire une fonction C <b>three_in_a_row</b> qui prend en argument un tableau d'entiers
ainsi que la taille de ce tableau. La fonction devra retourner 1 si elle detecte la présence 
dans le tableau de trois nombres impairs consécutifs. Si aucun tel triplet n'est dans le 
tableau, votre fonction devra retourner 0.
==

checks_args_stdin==#|python| 
[["Exemple simple", ["1", "2", "7", "-4", "1", "9", "7"], ""], 
 ["Tableau vide", [""], ""],
 ["Tableau petit", ["1111", "3333", "7777"], ""],
 ["Tableau trop petit", ["1111", "3333"], ""],
 ["Test aléatoire 1", [str(randint(-1000, 1000)) for i in range(randint(1, 5))], ""],
 ["Test aléatoire 2", [str(randint(-1000, 1000)) for i in range(randint(4, 8))], ""],
 ["Test aléatoire 3", [str(randint(-1000, 1000)) for i in range(randint(8, 12))], ""],
 ["Test aléatoire 4", [str(randint(-1000, 1000)) for i in range(randint(11, 15))], ""],
 ["Test aléatoire 5", [str(randint(-1000, 1000)) for i in range(randint(14, 18))], ""]]
==

editor.code==#|c|
int three_in_a_row(int* array, int size){
  /* Votre code ici... */
  return ...
}
==

solution==#|c|
int three_in_a_row(int* array, int size){
  int i;
  for (i=0 ; i+2<size ; i++)
    if ( (array[i] % 2) && (array[i+1] % 2) && (array[i+2] % 2) )
      return 1;
  return 0;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int* tab = (int*)malloc(sizeof(int) * argc);
  int i;

  for (i=1 ; i<argc ; i++)
    tab[i-1] = atoi(argv[i]);

  if (three_in_a_row(tab, argc))
    printf("Triplet d'inpairs consécutifs détecté.\n");
  else
    printf("Le tableaux ne contient pas de triplet de nombre impairs consécutifs.\n");

  free(tab);
  return 0;
}
==



