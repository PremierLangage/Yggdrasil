# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Trier des mots lus sur l'entrée standard.

author=Nicolas Borie
title=Trier des mots lus sur l'entrée standard
tag=input_output|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme qui lit des mots sur l'entrée standard puis réécrit 
ses mots sur la sortie standard (un par ligne) mais de manière triée. Il y 
aura au plus 100 mots sur l'entrée standard et chacun de ces mots comportera 
au plus 63 caractères.


Par exemple, si l'entrée standard contient

    Pommes
    Poires
    Patates
    Peche

Alors votre programme devra afficher

    Patates
    Peche
    Poires
    Pommes

==

editor.code==
#include ...

int main(int argc, char* argv[]){
  /* ...votre code ici... */
}

==

solution==

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

tests==
[["Basique", "", "Pommes\nPoires\nPatates\nPeche\n"], 
 ["Un mot", "", "Bonjour\n"],
 ["Quelques mots", "", "Pommes\nPoires\nPatates\nPeche\nBanane\nFraise\nCerise\nPrune\nAbricot\nTomate\nRadis"],
 ["Aléatoire", "", ""]]
==


