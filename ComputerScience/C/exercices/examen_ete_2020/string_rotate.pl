#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
title=Rotation des lettres dans une chaîne
tag=function|type|string

# editor.height=300px

text==
Écrire une fonction C **rotate_string** 
==

before ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]

checks_args_stdin = [["Example simple", ["ecrat"], ""], 
 ["Mot fixe", ["XXXXX"], ""],
 ["Mot vide", [""], ""],
 ["Example simple", ["plusieurs mot dans une seule chaine"], ""],
 ["Test aléatoire", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""],
 ["Test aléatoire", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""],
 ["Test aléatoire", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""]]

text+=" {{ editor|component }} "
==

editor.code==#|c|
void rotate_string(char* s){
  /* Votre code ici... */
}
==

solution==#|c|
void rotate_string(char* s){
  int i;
  int first;

  if (strlen(s) <= 1)
    return ;
  first = s[0];
  for (i=0 ; s[i+1] != '\0' ; i++){
    s[i] = s[i+1];
  }
  s[i] = first;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  char s[256];

  strcpy(s, argv[1]);
  printf("%s\n", s);
  rotate_string(s);
  printf("%s\n", s);
  return 0;
}
==

