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

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Prog C L2 Team

title=Périmètre d'un polygone

tag=structure|function|géométrie

text==#|markdown|
Pour la réalisation de cet exercice, on supposera que l'on dispose d'une constante **MAXSOMMETS** 
définie avec la directive préprocesseur `#define`.


On utilise la structure suivante pour représenter un point du plan :   

    typedef struct{
      int abs;
      int ord;
    }Point;

Écrire une fonction `distance ` qui reçoit deux *Point* et renvoie leur distance.


Définir une structure `Polygone` formée :

  * d'un tableau de *MAXSOMMETS* *Point*, de nom `sommets`,
  * d'un entier `nb_sommets`, le nombre effectif de points.


Écrire une fonction `perimetre` qui recoit un polygone et renvoie son périmètre.


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

