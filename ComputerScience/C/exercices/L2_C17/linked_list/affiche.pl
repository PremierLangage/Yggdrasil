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

author=Dominiqeu Revuz 


title= Afficher une liste 

tag=string|malloc|structure|recopiage|cellule|liste

editor.height=350px

text==#|markdown|
Écrire une fonction **afficher** qui prend en argument une Liste (voir éditeur).

Qui affiche (printf) les valeurs de la liste séparées par des espaces. 


==

editor.code==#|c|
#include <stdlib.h>
#include <string.h>

typedef struct _maillon{
    int valeur;
    struct _maillon *suivant;
} Maillon, *List;

void affiche(List l){
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
}Cell, *List;

Cell* allocate_cell(char* first_name, char* last_name, int age){
    Cell* n = (Cell*)malloc(sizeof(Cell));
    if (n == NULL)
      return NULL;
    n->first_name = strdup(first_name);
    n->last_name = strdup(last_name);
    n->age = age;
    return n;
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  Cell* c;
  int i;
  
  for (i=1 ; i+2<argc ; i+=3){
    c = allocate_cell(argv[i], argv[i+1], atoi(argv[i+2]));
    printf("Cellule %s %s age : %d\n", c->first_name, c->last_name, c->age);
    free(c->first_name);
    free(c->last_name);
    free(c);
  }

  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["Pierre", "Martin", "12"], ""],
 ["Chaînes vides", ["", "", "20"], ""],
 ["Long prénom", ["Son prénom est si long que ça, incroyable !", "Ouais", "243"], ""],
 ["Test aléatoire 1", [choice(["Pierre", "Paul", "Jacques", "Achraf", "Chan", "David", "Herbert", "Jean-Guy", "Pat", "Sophie", "Octave", "Mélanie", "Jean-Phillipe"]), choice(["Fonfec", "Herbien", "Zétofrey", "Hergébel", "Martin", "Chaouche", "Li", "Strauss", "Chirac", "El Mofty"]), str(randint(1, 100))], ""],
 ["Test aléatoire 2", [choice(["Pierre", "Paul", "Jacques", "Achraf", "Chan", "David", "Herbert", "Jean-Guy", "Pat", "Sophie", "Octave", "Mélanie", "Jean-Phillipe"]), choice(["Fonfec", "Herbien", "Zétofrey", "Hergébel", "Martin", "Chaouche", "Li", "Strauss", "Chirac", "El Mofty"]), str(randint(1, 100))], ""],
 ["Test aléatoire 3", [choice(["Pierre", "Paul", "Jacques", "Achraf", "Chan", "David", "Herbert", "Jean-Guy", "Pat", "Sophie", "Octave", "Mélanie", "Jean-Phillipe"]), choice(["Fonfec", "Herbien", "Zétofrey", "Hergébel", "Martin", "Chaouche", "Li", "Strauss", "Chirac", "El Mofty"]), str(randint(1, 100))], ""],
 ["Test aléatoire 4", [choice(["Pierre", "Paul", "Jacques", "Achraf", "Chan", "David", "Herbert", "Jean-Guy", "Pat", "Sophie", "Octave", "Mélanie", "Jean-Phillipe"]), choice(["Fonfec", "Herbien", "Zétofrey", "Hergébel", "Martin", "Chaouche", "Li", "Strauss", "Chirac", "El Mofty"]), str(randint(1, 100))], ""]]
==

astuces==#|python|
[
  { "content": """Pour préparer toute la mémoire, il faudra faire 3 appels à `malloc`. Il faut ainsi tout d'abord allouer la cellule puis allouer deux zones de taille adaptée pour chacune des chaînes à recopier."""},
  { "content": """Une stratégie raisonnable consiste à utiliser les fonctions suivantes : `strlen`, `malloc` puis `strcpy`."""},
  { "content": """Pour allouer la bonne quantité de mémoire pour une chaîne `s` il faut demander `(strlen(s) + 1)*sizeof(char)` octets. Sans le `+1`, il manquerait de la place pour recopier le caractère de fin de chaîne `\\0`."""},
]
==



