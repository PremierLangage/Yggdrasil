
# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une strcture C pour des points 2 dimensions entiers

author=Nicolas Borie et marc Zipstein
title=Structure pour points entiers en dimension 2
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarez et définissez une *structure* C nommé **Point2d**. Cette structure
devra contenir deux champs entiers nommés **abs** pour abcisse et **ord**
pour ordonnée.
Ecrire une fonction `affiche_point2d` qui recoit un point et affiche ses coodonnées.

==

editor.code==
typedef
...
Point2d; 
void affiche_point2d(...){
      printf("Le point est bien déclaré et a pour abcisse %d et ordonnée %d.\n", ..);

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
  affiche_point2d(G);
return 0;
}
==

tests== 
[ ["Déclaration et utilisation", "",""] ] 
==


