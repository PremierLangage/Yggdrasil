# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Macro de sécurisation

author=Nicolas Borie
title=Macro de sécurisation
tag=macro
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Sécurisez l'appel à la fonction **One_call()** en définissant une macro d'identifiant **BLOB** 



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

void One_call(void);

int main(int argc, char* argv[]){

==

codeafter==

  return 0;
}

void One_call(void){
  #ifndef BLOB
    printf("L'appel à la fonction One_call n'est pas sécurisé par la définition d'une macro BLOB.\n");
  #else
    printf("L'appel à la fonction One_call est sécurisé par la macro BLOB.\n");
  #endif
}

==

tests==
[ ["Exécution simple", "",""] ]
==


