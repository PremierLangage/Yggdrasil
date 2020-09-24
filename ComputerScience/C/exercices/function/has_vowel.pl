#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
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

author=Dominique Revuz

title=Trouver la première voyelle
tag=function|array|caractères|chaîne|string

editor.height=350px

text==
Écrire une fonction **has_vowel** qui prend une chaîne de caractères en
paramètre et qui retourne un entier correspondant au code ASCII de la
première voyelle trouvée dans la chaine. On retournera 0 si aucune
voyelle apparaît dans le mot.
==

editor.code==
const char* vowel="aeiouy";

int has_vowel(...){
  ...
}
==

solution==#|c|

#include <string.h>
const char* vowel="aeiouy";

int has_vowel(char *p){
  for(;*p;p++)
    if (strchr(vowel,*p)) return *p;
  return 0;
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){

  int a=has_vowel(argv[1]);
  if (a)
  printf("la chaîne \"%s\" contient la voyelle %c.\n",argv[1],a);
  else
  printf("la chaîne \"%s\" ne contient pas de voyelle.\n", argv[1]); 
  return 0;
}
==

checks_args_stdin==#|python|
[["Test Basique", ["la belle voyelle"], ""],
 ["Sans voyelle", ["bcdfghjklmnpqrstvwxz"], ""],
 ["Trouve un a", ["aaaa"], ""],
 ["Trouve un e", ["xxxea"], ""],
 ["Trouve un i", ["xxxiea"], ""],
 ["Trouve un o", ["xxxoo"], ""],
 ["Trouve un y", ["xxxy"], ""]]
==


