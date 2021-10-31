#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Cellule pour liste chaînée de double
tag=malloc|structure|chaînage|double

editor.height=300px

text==#|markdown|
Écrire une fonction d'allocation pour une **cellule de liste chainée** 
contenant des doubles (un double par cellule). Une fonction d'allocation
raisonnable prépare de la mémoire pérenne, renseigne le double dans
la cellule et initialise la cellule de manière à ce qu'elle ne possède
pas de suivant. Finalement, on retourne l'adresse de la cellule correctement
allouée et initialisée.


==

editor.code==#|c|
#include <stdio.h>
#include <stdlib.h>

typedef struct cell{
  double value;
  struct cell* next;
}Cell, *List;

... Allocate_cell(double val){
  // Votre code ici...
}
==

solution==#|c|
#include <stdio.h>
#include <stdlib.h>

typedef struct cell{
  double value;
  struct cell* next;
}Cell, *List;

Cell* Allocate_cell(double val){
  Cell* ans;

  ans = (Cell*)malloc( sizeof(Cell) );
  if (ans == NULL)
    return ans;
  ans->next = NULL;
  ans->value = val;
  return ans;
}
==

code_before==#|c|
#define _POSIX_C_SOURCE 200112L
==

code_after==#|c|
int main(int argc, char* argv[]){
  Cell* ans=NULL;
  
  printf("Allocation\n");
  ans = Allocate_cell(strtof(argv[1], NULL));
  printf("Utilisation\n");
  printf("value : %f\n", ans->value);
  printf("next : %p\n", (void*)ans->next); 
  printf("Libération\n");
  free(ans);
  
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["3.141592"], ""],
 ["Test avec zéro", ["0"], ""],
 ["Test aléatoire 1", [str(100*random())], ""],
 ["Test aléatoire 2", [str(100*random())], ""],
 ["Test aléatoire 3", [str(100*random())], ""]]
==

astuces==#|python|
[
  { "content": """Les actions à implanter sont : demander la mémoire, mettre le nombre floatant à sa place et aussi initialiser le suivant à l'adresse invalide."""},
  { "content": """Comme l'on veut qu'une cellule, le mieux est de faire un appel avec `(Cell*)malloc( sizeof(Cell) )`, pas besoin de multiplier par `1` car on ne veut qu'une cellule. Ce retour de `malloc` doit être stocké dans une variable locale de type `Cell*` avant d'être retournée à la fin."""},
  { "content": """La bonne variable locale à utiliser est par exemple `Cell* c = NULL;`. Ensuite, on l'affecte avec `c = (cast)malloc(...)` et on initialise les champs avec la flèche : `c->next = ...;` et `c->value = ...;`."""},
]
==


