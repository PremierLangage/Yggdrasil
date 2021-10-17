#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Nicolas Borie

title=Structure C pour une personne

tag=structure|simple|entier|chaine

text==#|markdown|
Déclarer et définir une *structure* C nommé *People*. Cette structure
devra contenir deux champs pour des chaînes de caractères C d'au plus
63 caractères. Ces deux champs devront être nommés *first_name* et
*last_name*. Ajouter aussi un champ entier qui devra s'appeler *age*.

==

editor.code==#|c|
typedef ...
==

solution==#|c|
typedef struct {
  char first_name[64];
  char last_name[64];
  int age; 
}People;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
    
int main(int argc, char* argv[]){
  People P;

  strcpy(P.first_name, argv[1]);
  strcpy(P.last_name, argv[2]);
  P.age = atoi(argv[3]);
  
  printf("Personne reconnue : %s %s %d\n", P.first_name, P.last_name, P.age);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation 1", ["John", "Doe", "42"],""],
  ["Déclaration et utilisation 2", ["Master", "Yoda", "913"],""],
  ["Déclaration et utilisation 2", ["Nicolaï Yvanovich", "Borisky", "12"],""] ] 
==



