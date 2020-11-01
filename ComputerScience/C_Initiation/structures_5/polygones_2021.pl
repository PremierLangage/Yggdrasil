
# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Polygones

author=  
title= Périmetre d'un polygone
tag=structure|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
On utilise la structure<br>
typedef struct{<br>
int x,y;<br>
}Point;<br>
pour représenter un point du plan. (On suppose qu'elle est déjà définie.)<br>
Ecrire une fonction `distance ` qui reçoit deux *Point* et renvoie leur distance.<br>
Définir une structure `Polygone` formée : 
 - d'un tableau de *Point* de nom `sommets`, et
 - d'un entier `nb_sommets`, le nombre effectif de points. <br>

Ecrire une fonction `perimetre` qui recoit un polygone et renvoie son périmetre.
==

editor.code==
typedef struct {
...
}Polygone;

double distance(...){
  ...
}
double perimetre(...){
...
}
  
==

solution==
typedef struct {
Point sommets[MAXSOMMETS];
int nb_sommets;
}Polygone;

double distance(Point a ,Point b){
  return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y));
}
double perimetre(Polygone p){
int i;
double perim=distance(p.sommets[p.nb_sommets-1],p.sommets[0]);
for(i=0;i<p.nb_sommets-1;i++)
  perim+=distance(p.sommets[i],p.sommets[i+1]);
return perim;
}

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

int main(){
  Polygone  tab;
  int size =0 ;
  int x,y;
  float d;

  while (scanf("%d", &x) == 1){
    scanf("%d",&y);
    tab.sommets[size].x = x;
    tab.sommets[size].y=y;
    size++;
  }
  tab.nb_sommets=size;
  d=perimetre(tab);

  printf("le perimetre mesure %f\n",d);
  return 0;
}
==

tests== 
[ ["Pythagorre", "", "0 0 0 3 4 0 "],
	
  ["sommets aléatoires","", " ".join([str(random.randint(-10,10)) for i in range(2*random.randint(3,6))]) ] ]
==









