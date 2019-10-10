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
int multiplication(int a, int b, int c){
  return a*b*c;
}
==

solution==

long int multiplication(int a, int b, int c){
  return ((long int)a)*b*c;
}
==

codeafter==

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("Le produit %d x %d x %d vaut %ld.\n", a, b, c, (long int)multiplication(a, b, c));
  return 0;
}
==


tests==
[ ["simple éxécution", "1 1 1",""],
  ["cinq au cube", "5 5 5",""] ]
==


