# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
#

author=Nicolas Borie
title=Fonction qui affiche la date de compilation
tag=macro|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Sécurisez l'appel à la fonction **One_call()** en définissant une macro d'identifiant **BLOB**. 

==

editor.code==
#...
#...

/* A macro BLOB should exist when the following call would be executed. */
One_call();

#...
==

solution==

#ifndef BLOB
#define BLOB

/* A macro BLOB should exist when the following call would be executed. */
One_call();

#endif

==


codebefore==

#include <stdio.h>

void One_call(void){
  #ifndef BLOB
    printf("L'appel à la fonction One_call n'est pas sécurisé par la définition d'une macro BLOB.\n");
  #else
    printf("L'appel à la fonction One_call est sécurisé par la macro BLOB.\n");
  #endif
}

==

codeafter==

int main(int argc, char* argv[]){
  One_call();

  return 0;
}

==

tests==
[ ["Exécution simple", "",""] ]
==




