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

title=Trier des mots lus sur l'entrée standard
tag=input_output|string|tableaux|difficile|entrées|sorties|tri

text==
Écrire un programme qui lit des mots sur l'entrée standard puis réécrit 
ces mots sur la sortie standard (un par ligne) mais de manière triée. Il y 
aura au plus 50 mots sur l'entrée standard et chacun de ces mots comportera 
au plus 63 caractères.


Par exemple, si l'entrée standard contient :

    Pommes
    Poires
    Patates
    Peche

Alors votre programme devra afficher :

    Patates
    Peche
    Poires
    Pommes

==

editor.height=400px

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){
  /* ...votre code ici... */
}
==

solution==#|c|
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int read_word(char** tab, int* size){
  int n = scanf("%s", tab[*size]);
  if (n == 1){
    *size = *size + 1;
  }
  return n;
}

void sort_word(char** tab, int size){
  int i, j;
  char tmp[64];

  for(i=size-1 ; i>=0 ; i--){
    for(j=0 ; j<i ; j++){
      if (strcmp(tab[j], tab[j+1]) > 0){
        strcpy(tmp, tab[j]);
        strcpy(tab[j], tab[j+1]);
        strcpy(tab[j+1], tmp);
      }
    }
  }
}

int main(int argc, char* argv[]){
  char** tab;
  int nb_mots = 0;
  int i;
  
  tab = malloc(100 * sizeof(char*));
  for (i=0 ; i<100 ; i++){
    tab[i] = malloc(64 * sizeof(char));
  }

  while(1){
    if (read_word(tab, &nb_mots) != 1){
      break;
    }
  }

  sort_word(tab, nb_mots);

  for (i=0 ; i<nb_mots ; i++){
    printf("%s\n", tab[i]);
  }

  return 0;
}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Test basique", [], "Pommes\nPoires\nPatates\nPeche\n"], 
 ["Test avec un mot", [], "Bonjour\n"],
 ["Quelques mots", [], "Pommes\nPoires\nPatates\nPeche\nBanane\nFraise\nCerise\nPrune\nAbricot\nTomate\nRadis"],
 ["Test aléatoire 1", [], "".join(["".join([chr(randint(97, 122)) for i in range(randint(1, 20))])+"\n" for j in range(5, 10)])],
 ["Test aléatoire 2", [], "".join(["".join([chr(randint(97, 122)) for i in range(randint(1, 20))])+"\n" for j in range(10, 20)])],
 ["Test aléatoire 3", [], "".join(["".join([chr(randint(97, 122)) for i in range(randint(1, 20))])+"\n" for j in range(20, 49)])] ]
==

