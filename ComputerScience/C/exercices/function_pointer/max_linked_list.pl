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
title=Maximum générique d'une liste chaînée de personnes
tag=function|type|pointeur|function_pointer|difficile

text==
Écrire une fonction C **max_list** dont le prototype ressemble à celui de  
la fonction qsort. La 
fonction prendra donc en argument une liste chaînée de personnes (prénom, nom et age) 
mais aussi une fonction de 
comparaison. La fonction devra retourner l'adresse de la cellule contenant l'élément 
minimal de la liste chaînée, selon la fonction de comparaison. Si le tableau est vide, 
votre fonction devra retourner -1.

Pour rappel, une fonction de comparaison correcte vis à vis du langage C, 
évaluée sur des données X (premier argument) et Y (second argument) retourne un 
entier négatif, nul ou positif respectivement lorsque X < Y, X = Y ou X > Y.
Si la liste contient plusieurs occurences de son minimum, retournez l'adresse 
de la première cellule en partant de la tête qui réalise ce minimum.
==

editor.code==#|c|
typedef struct cell{
  char first_name[64];
  char last_name[64];
  int age;
  struct cell* next;
}Cell, *List;

Cell* max_list(List l, int (*compar)(const void *, const void *)){
  /* Votre code ici... */
}
==

solution==#|c|
typedef struct cell{
  char first_name[64];
  char last_name[64];
  int age;
  struct cell* next;
}Cell, *List;

Cell* max_list(List l, int (*compar)(const void *, const void *)){
  Cell* adr_max;
  for (adr_max = NULL ; l!=NULL; l = l->next ){
    if ((adr_max == NULL) || compar(adr_max, l) < 0)
      adr_max = l;
  }
  return adr_max;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Exécution simple", [], ""]]
==


