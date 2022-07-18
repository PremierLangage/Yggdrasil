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

text==#|markdown|
L'objectif de cet exercice est de coder une fonction d'insertion triée 
dans un tableau dynamique. 

<br>

La fonction à coder est nommée **add_ordered_list**. Elle prend en argument 
un pointeur vers une structure modélisant des listes dynamiques ainsi que 
la nouvelle valeur à insérer. Si la taille limite à été atteinte, vous devrez
réallouer le champs **values** de la liste ordonnée. Veilliez aussi à bien 
insérer les nouvelles valeurs de manière à ce que la liste reste triée en 
valeur croissante.

<br>

Quand une réallocation est déclanchée, rajouter 10% de mémoire supplémentaire 
(en veillant bien a toujours rajouter au moins une case !). La fonction retourne 
**1** si tout s'est bien passé et **0** en cas d'erreur. 
==

editor.code==#|c|
#include <stdlib.h>
#include <stdio.h>

typedef struct{
  int* values;       /* Ordered array containing values of the list */
  int current_size;  /* Number of elements inside the list */
  int memory_size;   /* Memory size of values (offen larger than the current size) */
}Ordered_list;

int add_ordered_list(Ordered_list* s, int val){
  /* votre code ici... */
}
==

solution==#|c|
#include <stdlib.h>
#include <stdio.h>

typedef struct{
  int* values;       /* Ordered array containing values of the list */
  int current_size;  /* Number of elements inside the list */
  int memory_size;   /* Memory size of values (offen larger than the current size) */
}Ordered_list;

int add_ordered_list(Ordered_list* s, int val){
  int new_size, i, pos;
  /* reallocation if needed */
  if (s->current_size == s->memory_size){
    new_size = s->memory_size + (s->memory_size / 10) + 1;
    s->values = realloc(s->values, new_size*sizeof(int));
    if (s->values == NULL){
      fprintf(stderr, "Memory reallocation error\n");
      return 0;
    }
    s->memory_size = new_size;
  }
  /* search pos, the insertion position index */
  i = 0;
  while ((i < s->current_size) && (s->values[i] <= val)){
    i++;
  }
  pos = i;
  /* translate by 1 on the right higher values */
  for(i=s->current_size-1 ; i>=pos ; i--)
    s->values[i+1] = s->values[i];
  /* insertion and update the size */
  s->values[pos] = val;
  s->current_size++;
  return 1;
}
==

code_before==#|c|
#include <time.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int seed = atoi(argv[1]);
  int nb_val = atoi(argv[2]);
  int max_val = atoi(argv[3]);
  int i;
  Ordered_list l;
  
  l.values = malloc(10*sizeof(int));
  l.current_size = 0;
  l.memory_size = 10;
  srand(seed);

  for (i=0 ; i<nb_val ; i++){
    add_ordered_list(&l, rand()%max_val);
  }
  for (i=0 ; i<l.current_size ; i++){
    printf("%d ", l.values[i]);
  }
  putchar('\n');
  return 0;
}
==

checks_args_stdin==#|python|
[["Un seul appel", [str(randint(0, 1000000000)), "1", "100"], ""],
 ["Que des zéros", [str(randint(0, 1000000000)), str(randint(5, 15)), "1"], ""],
 ["Test aléatoire 1", [str(randint(0, 1000000000)), str(randint(5, 15)), str(randint(5, 15))], ""],
 ["Test aléatoire 2", [str(randint(0, 1000000000)), str(randint(20, 40)), str(randint(5, 15))], ""],
 ["Test aléatoire 3", [str(randint(0, 1000000000)), str(randint(20, 40)), str(randint(5, 15))], ""],
 ["Test aléatoire 4", [str(randint(0, 1000000000)), str(randint(100, 200)), str(randint(50, 100))], ""],
 ["Test aléatoire 5", [str(randint(0, 1000000000)), str(randint(1000, 2000)), str(randint(1000, 2000))], ""]]
==


