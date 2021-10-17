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

title=Structure pour points entiers en dimension 2
tag=structure|simple|entier

text==
Déclarez et définissez une *structure* C nommé **Point2d**. Cette structure
devra contenir deux champs entiers nommés **abs** pour abcisse et **ord**
pour ordonnée.


==

editor.code==#|c|
typedef
...
Point2d;
==

solution==#|c|
typedef struct point2d{
  int abs;
  int ord; 
}Point2d;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  Point2d G = {12, -3};

  printf("Le point G est bien déclaré et a pour abcisse 12==%d et ordonnée -3==%d.\n", G.abs, G.ord);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation", [],""] ] 
==

astuces==#|python|
[
  { "content": """C'est un exercice d'application direct du cours extrement simple. Si vous décochez cet indice, taper donc `structure struct C` dans google et lisez un ou deux articles."""}
]
==
