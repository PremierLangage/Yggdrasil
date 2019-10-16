# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une strcture C pour des points 2 dimensions entiers

author=Nicolas Borie
title=Structure pour points entiers en dimension 2
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

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

