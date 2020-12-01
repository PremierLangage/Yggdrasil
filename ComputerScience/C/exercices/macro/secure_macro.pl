#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Macro de sécurisation
tag=macro|entête|inclusion|sécurité

text==

Sécurisez l'appel à la fonction **One_call()** en définissant une macro d'identifiant **BLOB** .


==

editor.code==#|c|
#...
#...

/* A macro BLOB should exist when the following call would be executed. */
One_call();

#...
==

solution==#|c|
#ifndef BLOB
#define BLOB

/* A macro BLOB should exist when the following call would be executed. */
One_call();

#endif
==


code_before==#|c|

#include <stdio.h>

void One_call(void);

int main(int argc, char* argv[]){

==

code_after==#|c|

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

checks_args_stdin==#|python|
[ ["Exécution simple", "",""] ]
==


