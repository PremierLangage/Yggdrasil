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
    Pommes
    Poires

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

int read_word(char[100][64] tab, int* size){
  int n = scanf("%s", tab[*size]);
  if (n == 1){
    *size = *size + 1;
  }
  return n;
}

void sort_word(char** tab, int size){
  int i, j;
  tmp[64];

  for(i=0 ; i<size ; i++){
    for(j=0 ; j<i ; j++){
      if (strcmp(tab[j], tab[j+1]) < 0){
        strcpy(tmp, tab[j]);
        strcpy(tab[j], tab[j+1]);
        strcpy(tab[j], tmp);
      }
    }
  }
}

int main(int argc, char* argv[]){
  char tab[100][64];
  int nb_mots = 0;
  int i;

  while(1){
    if (read_word(tab, &nb_mots) != 1){
      break;
    }
  }

  for (i=0 ; i<nb_mots ; i++){
    printf("%s\n", tab[i]);
  }

  return 0;
}

==

tests==
[["Basique", "", "Pommes\nPoires\nPatates\nPeche\n"]]
==


