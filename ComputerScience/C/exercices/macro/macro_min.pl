# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Macro à paramètre minimum

author=Nicolas Borie
title=Macro de sécurisation
tag=macro
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Sécurisez l'appel à la fonction **One_call()** en définissant une macro d'identifiant **BLOB** 



==

editor.code==
#... MIN(a, b) ...

==

solution==

#define MIN(a, b) (a) <= (b) ? (a) : (b) 

==


codebefore==

#include <stdio.h>

==

codeafter==

int main(int argc, char* argv[]){
  printf("MIN(%s, %s) = %s.\n", 2, 4, MIN(2, 4));

  return 0;
}

==

tests==
[ ["Exécution simple", "1 2",""] ]
==


