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

title=Ajout ordonné dans une liste triée dynamique
tag=allocation|fonction|reallocation|realloc|difficile

editor.height=350px

text==
L'objectif de cet exercice est de coder une fonction d'insertion triée 
dans un tableau dynamique (sa taille mémoire s'adapte dynamiquement). 

<br>

La fonction à codé est nommé **add_ordered_list**. Elle prend en argument 
un pointeur vers une structure modélisant des listes dynamiques ainsi que 
la nouvelle valeur à insérer. 
==

editor.code==#|c|
#include <stdlib.h>
#include <stdio.h>

typedef struct{
  int* values;       /* Ordered array containing values of the list */
  int current_size;  /* Number of elements inside the list */
  int memory_size;   /* Memory size of values (offen larger than the current size) */
}Ordered_list;

int add_ordered_set(Ordered_list* s, int val){
  /* votre code ici... */
}
==

solution==#|c|
typedef struct{
  int* values;       /* Ordered array containing values of the set */
  int current_size;  /* Number of elements inside the set */
  int memory_size;   /* Memory size of values (offen larger than the current size) */
}Ordered_set;

int add_ordered_set(Ordered_set* s, int val){
  if (s->current_size == s->memory_size){

  }
}
==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Exécution simple", [""], ""]]
==


