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
int multiplication(int a, int b){
  return a*b;
}
==

solution==

long int multiplication(int a, int b){
  return ((long int)a)*b;
}
==

codeafter==

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf("Le produit %d x %d vaut %ld.\n", a, b, (long int)multiplication(a, b));
  return 0;
}
==


tests==
[ ["simple éxécution", "1 1",""],
  ["cinq au carré", "5 5",""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""],
  ["aléatoire", " ".join([str(random.randint(0,2000000000)) for i in range(2)]),""] ]
==


