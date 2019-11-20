# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Macro à paramètre minimum

author=Nicolas Borie
title=Macro minimum
tag=macro
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une macro MIN à deux paramètres qui retourne le minimum de ces deux arguments.



==

editor.code==
#... MIN ...

==

solution==

#define MIN(a, b) (a) <= (b) ? (a) : (b) 

==


codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

==

codeafter==

int main(int argc, char* argv[]){
  srand(atoi(argv[1]));

  printf("%d\n", MIN(2, 4));
  printf("%d\n", MIN(rand(), rand()));
  printf("%d\n", MIN(rand(), rand()));
  printf("%d\n", MIN(rand(), MIN(rand(), rand())));
  printf("%d\n", MIN(MIN(rand(), rand()), MIN(rand(), rand())));

  return 0;
}

==

tests==
[ ["Exécution simple", str(random.randint(0,1000000)),""] ]
==


