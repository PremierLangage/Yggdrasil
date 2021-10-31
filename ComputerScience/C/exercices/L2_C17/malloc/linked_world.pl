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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Cellule pour contenir un mot
tag=malloc|structure|string|

editor.height=450px

text==
Écrire une fonction d'allocation pour une cellule de liste chainée
contenant un mot (une chaîne de caractères). Votre fonction prendra
en argument une chaîne de caractères (venant d'une mémoire non pérenne). 
Votre fonction devra allouer une cellule et de la place mémoire pour 
recopier la chaîne de caractères sur une zone pérenne. Finalememt,
vous retournerez l'adresse de la cellule fraichement allouée avec
tous ces champs correctement renseignés.
==

editor.code==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct cell{
  char* word;
  struct cell* next;
}Cell, *List;

... Allocate_cell(char* s){
  /* ... votre code ici ... */
}
==

solution==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct cell{
  char* word;
  struct cell* next;
}Cell, *List;

Cell* Allocate_cell(char* s){
  Cell* ans;

  ans = malloc( sizeof(Cell) );
  if (ans == NULL)
    return NULL;
  ans->word = malloc( (strlen(s) + 1) * sizeof(char) );
  if (ans->word == NULL){
    free(ans);
    return NULL;
  }
  strcpy(ans->word, s);
  ans->next = NULL;
  return ans;
}
==

code_before==#|c|
==

code_after==#|c|
int main(int argc, char* argv[]){
  Cell* ans=NULL;
  
  printf("Allocation\n");
  ans = Allocate_cell(argv[1]);
  printf("Utilisation\n");
  printf("value : %s\n", ans->word);
  printf("next : %p\n", (void*)ans->next); 
  printf("Libération\n");
  free(ans->word);
  free(ans);
  
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["mot"], ""],
 ["Chaîne vide", [""], ""],
 ["Une seule chaîne", ["mot en plusieurs morceaux très long"], ""],
 ["Test aléatoire 1", ["".join([chr(ord('a')+randint(0,25)) for i in range(20)])], ""],
 ["Test aléatoire 2", ["".join([chr(ord('a')+randint(0,25)) for i in range(20)])], ""]]
==


astuces==#|python|
[
  { "content": """Les actions à implanter sont : demander la mémoire, mettre le nombre floatant à sa place et aussi initialiser le suivant à l'adresse invalide."""},
  { "content": """Comme l'on veut qu'une cellule, le mieux est de faire un appel avec `(Cell*)malloc( sizeof(Cell) )`, pas besoin de multiplier par `1` car on ne veut qu'une cellule. Ce retour de `malloc` doit être stocké dans une variable locale de type `Cell*` avant d'être retournée à la fin."""},
  { "content": """La bonne variable locale à utiliser est par exemple `Cell* c = NULL;`. Ensuite, on l'affecte avec `c = (cast)malloc(...)` et on initialise les champs avec la flèche : `c->next = ...;` et `c->value = ...;`."""},
]
==

