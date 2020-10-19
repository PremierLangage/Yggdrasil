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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Structure pour points entiers en dimension 2
tag=structure

text==
Déclarez et définissez une *structure* C nommé **Point2d**. Cette structure
devra contenir deux champs entiers nommés **abs** pour abcisse et **ord**
pour ordonnée.

==

editor.code==
typedef
...
Point2d;

==

solution==

typedef struct point2d{
  int abs;
  int ord; 
}Point2d;

==

codeafter==
 
#include <stdio.h>

int main(int argc, char* argv[]){
  Point2d G = {12, -3};

  printf("Le point G est bien déclaré et a pour abcisse 12==%d et ordonnée -3==%d.\n", G.abs, G.ord);
  return 0;
}

==

tests== 
[ ["Déclaration et utilisation", "",""] ] 
==


