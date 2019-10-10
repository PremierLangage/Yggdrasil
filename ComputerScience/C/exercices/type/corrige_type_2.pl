# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
author=Nicolas Borie
title=Programme manipulant des types
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Le programme suivant comporte une erreur de type. Tentez de corriger cette erreur !

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int max(int tab[], int size){
  int i;
  unsigned int max=0;

  for(i=0 ; i<size ; i++){
    if (tab[i] > max)
      max = tab[i];
  }
  return max;
} 
==

solution==

int max(int tab[], int size){
  int i;
  int max=tab[0];

  for(i=1 ; i<size ; i++){
    if (tab[i] > max)
      max = tab[i];
  }
  return max;
}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }

  printf("Le maximum des entiers reçus ur l'entrée standard est %d\n", max(tab, size));

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
  ["prmier problème", "","-1 -2"] ]
==


