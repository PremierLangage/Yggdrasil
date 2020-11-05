
# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Polygones

author=  
title= Périmètre d'un polygone
tag=structure|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Pour la réalisation de cet exercice, on supposera que l'on dispose d'une constante *MAXSOMMETS*.<br>
<br>

On utilise la structure suivante pour représenter un point du plan :<br>
<br>
typedef struct{<br>
    int abs, ord;<br>
} Point;<br> <br>

Ecrire une fonction `distance ` qui reçoit deux *Point* et renvoie leur distance.<br>
<br>
Définir une structure `Polygone` formée : <br>
   - d'un tableau de *MAXSOMMETS* *Point*, de nom `sommets`, <br>
   - d'un entier `nb_sommets`, le nombre effectif de points. <br>
<br>

Ecrire une fonction `perimetre` qui recoit un polygone et renvoie son périmètre.
==

editor.code==
typedef struct{
    ...
} Polygone;

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
} Polygone;

double distance(Point a ,Point b){
    return sqrt((a.abs-b.abs)*(a.abs-b.abs)+(a.ord-b.ord)*(a.ord-b.ord));
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
int abs;
int ord;
}Point;

==

codeafter==

int main(){
  Polygone  tab;
  int size =0 ;
  int abs,ord;
  float d;

  while (scanf("%d", &abs) == 1){
    scanf("%d",&ord);
    tab.sommets[size].abs = abs;
    tab.sommets[size].ord=ord;
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












