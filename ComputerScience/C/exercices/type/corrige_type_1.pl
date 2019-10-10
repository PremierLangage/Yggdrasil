# Copyright 2016 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Hello world en C
#
# Exercice simple pour tester PL avec le langage C.


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
float moyenne(int a, int b, int c){
    return (a+b+c) / 3;
}
==

solution==
float moyenne(int a, int b, int c){
    return (a+b+c) / 3.0;
}
==

codeafter==

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("La moyenne de %d, %d et %d est : %f.\n", a, b, c, moyenne(a, b, c));

  return 0;
}
==


tests==
[ ["simple éxécution", "1 1 1",""],
  ["simple éxécution", "1 1 2",""] ]
==

