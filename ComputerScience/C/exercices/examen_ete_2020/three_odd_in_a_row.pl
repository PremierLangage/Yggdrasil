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
title=Trois nombres impairs d'affilée
tag=function|type|array

# editor.height=300px

text==

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
int three_in_a_row(int* array, int size){
  /* Votre code ici... */
  return ...
}
==

solution==#|c|
int three_in_a_row(int* array, int size){
  int i;
  for (i=0 ; i+2<size ; i++)
    if ( (array[i] % 2) && (array[i+1] % 2) && (array[i+2] % 2) )
      return 1;
  return 0;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  
  return 0;
}
==


