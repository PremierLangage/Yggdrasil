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

title=Deux chaînes à allouer et recopier dans une structure
tag=string|malloc|structure|recopiage

editor.height=350px

text==#|markdown|
Écrire une fonction **initialize_people** qui prend en argument l'adresse 
d'une structure **People** ainsi que deux chaînes de caractères. Votre
fonction devra allouer dynamiquement la place mémoire nécessaire pour 
contenir une copie des deux chaines en argument. Votre fonction devra
finalement recopier intégralement les deux chaînes dans les deux champs
fraichement alloués. 

<br>

Inutile d'allouer la structure **People**, le pointeur fourni en argument
pointe déjà vers une structure **People** valide, vous sevez travaillez sur
les champs de la structure pointée.


==

editor.code==#|c|
#include <stdlib.h>
#include <string.h>

typedef struct{
  char* first;
  char* last;
}People;

int initialize_people(People* p, char* first_name, char* last_name){
  // Votre code ici...
}
==

solution==#|c|
#define _DEFAULT_SOURCE

#include <stdlib.h>
#include <string.h>

typedef struct{
  char* first;
  char* last;
}People;

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
 ["Test aléatoire 2", ["".join([chr(ord('a')+randint(0, 25)) for i in range(randint(3, 20))]) for k in range(2)], ""]]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""}
]
==



