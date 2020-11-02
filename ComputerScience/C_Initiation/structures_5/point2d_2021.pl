

# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une strcture C pour des points 2 dimensions entiers

author=  
title=Structure pour points entiers en dimension 2
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarez et définissez une *structure* C nommée **Point2d**. Cette structure
devra contenir deux champs entiers nommés **abs** pour abcisse et **ord**
pour ordonnée.

Ecrire une fonction `affiche_point2d` qui recoit un point et affiche ses coodonnées.

==

editor.code==
typedef
...
Point2d; 

void affiche_point2d(...){
      printf("Le point a pour abcisse %d et ordonnée %d.\n", ..);

==
codebefore==
#include <stdio.h>
#include <stdlib.h>

==
solution==
typedef struct point2d{
  int abs;
  int ord; 
}Point2d;
void affiche_point2d(Point2d p){
      printf("Le point a pour abcisse %d et ordonnée %d.\n", p.abs,p.ord);
}

==

codeafter==
 
#include <stdio.h>

int main(int argc, char* argv[]){
  Point2d G;
  G.abs=atoi(argv[1]);
  G.ord=atoi(argv[2]);
  affiche_point2d(G);
return 0;
}
==

tests==
[
 ["Déclaration et utilisation",str(random.randint(-20,20))+" "+str(random.randint(-20,20))  ,""],
]
==





