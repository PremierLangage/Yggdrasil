
# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Polygones

author=Marc Zipstein
title= Périmetre d'un polygone
tag=structure|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
On utilise la structure<br>
typedef struct{<br>
int x,y;<br>
}Point;<br>
pour représenter un point du plan.<br>
Ecrire une fonction `distance ` qui reçoit deux *Point* et renvoie leur distance.<br>
Définir une structure `Polygone` formé : 
d'un tableau de *Point* de nom `sommets`et
d'un entier `nb_sommets`, le nombre effectif de points.br>

Ecrire une fonction `perimetre` qui recoit un polygone et renvoie son périmetre.
==

editor.code==
typedef struct {
Point sommets[MAXSOMMETS];
int nb_sommets;
}Polygone;



  
==

solution==
typedef struct {
Point sommets[MAXSOMMETS];
int nb_sommets;
}Polygone;


  

==

codebefore==

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define MAXSOMMETS 50

typedef struct{
int x;
int y;
}Point;

==

codeafter==
float distance(Point a ,Point b){
return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y));
}

int main(){
  Polygone  tab;
  int size =0 ;
  int x,y,i;
  float d;

  while (scanf("%d", &x) == 1){
    scanf("%d",&y);
    tab.sommets[size].x = x;
    tab.sommets[size].y=y;
    size++;
  }
  tab.nb_sommets=size;
  d=distance(tab.sommets[0],tab.sommets[1]);

  printf("le perimetre mesure %f\n",d);
  return 0;
}
==

tests== 
[ ["Pythagorre", "", "0 0 0 3 4 0 "],
	
  ["vecteurs aléatoires","", " ".join([str(random.randint(-10,10)) for i in range(6)]) ] ]
==




