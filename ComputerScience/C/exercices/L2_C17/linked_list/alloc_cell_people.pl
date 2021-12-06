#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Allouer des cellules pour des personnes

tag=string|malloc|structure|recopiage|cellule|liste

editor.height=350px

text==#|markdown|
Écrire une fonction **allocate_cell** qui prend en argument deux chaînes 
de caractères ainsi qu'un entier. Votre
fonction devra allouer dynamiquement la place mémoire nécessaire pour fabriquer une
nouvelle cellule **Cell** ainsi que pour 
contenir une copie des deux chaines de caractères en argument. Votre fonction devra
finalement recopier intégralement les deux chaînes au bout des les deux champs
eux aussi fraichement alloués. 


==

editor.code==#|c|
#include <stdlib.h>
#include <string.h>

typedef struct cell{
  char* first_name;
  char* last_name;
  int age;
  struct cell* next;
}Cell;

Cell* allocate_cell(char* first_name, char* last_name, int age){
  // Votre code ici...
}
==

solution==#|c|
#define _DEFAULT_SOURCE

#include <stdlib.h>
#include <string.h>

typedef struct cell{
  char* first_name;
  char* last_name;
  int age;
  struct cell* next;
}Cell;

int initialize_people(People* p, char* first_name, char* last_name){
    p->first = strdup(first_name);
    p->last = strdup(last_name);
    return (p->first != NULL) && (p->last != NULL);
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  People p;

  initialize_people(&p, argv[1], argv[2]);
  printf("Init %s %s\n", p.first, p.last);

  free(p.first);
  free(p.last);
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["Pierre", "Paul", "Jacques"], ""],
 ["Chaînes vides", ["", ""], ""],
 ["Long prénom", ["Son prénom est si long que ça, incroyable !", "Ouais"], ""],
 ["Test aléatoire 1", ["".join([chr(ord('a')+randint(0, 25)) for i in range(randint(3, 20))]) for k in range(2)], ""],
 ["Test aléatoire 2", ["".join([chr(ord('a')+randint(0, 25)) for i in range(randint(3, 20))]) for k in range(2)], ""],
 ["Test aléatoire 3", ["".join([chr(ord('a')+randint(0, 25)) for i in range(randint(3, 20))]) for k in range(2)], ""]]
==

astuces==#|python|
[
  { "content": """Pour chaque champ de la structure, il faut faire les choses en deux temps : allouer la mémoire en bonne quantité puis recopier les chaînes dans les zones fraichement allouées."""},
  { "content": """Une stratégie raisonnable consiste à utiliser les fonctions suivantes : `strlen`, `malloc` puis `strcpy`."""},
  { "content": """Pour allouer la bonne quantité de mémoire pour une chaîne `s` il faut demander `(strlen(s) + 1)*sizeof(char)` octets. Sans le `+1`, il manquerait de la place pour recopier le `\0`."""},
]
==



