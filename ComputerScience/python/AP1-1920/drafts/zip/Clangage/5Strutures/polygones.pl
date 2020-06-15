
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
Définir une structure `Polygone` formé<br>
d'un tableau de *Point* de nom `sommets`;<br>
d'un entier `nb_sommets`, le nombre effectif de points<br>

Ecrire une fonction `perimetre` qui recoit un polygone et renvoie son périmetre
==

editor.code==

  
==

solution==
typedef struct {
Point sommets[MAXSOMMETS];
int nb_sommets;

float distance(Point a ,Point b){
return (sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y)));
}

float perimetre(Polygone p[]){
int i;
float perim=distance(p.sommets[p.nb_sommets-1],p.sommets[0]);
fot(i=0;i<p.nb_sommets-1;i++)
perim+=distance(p.sommets[i],p.sommets[i+1]);
return perim;
}

==

codebefore==

#include <stdlib.h>
#include <stdio.h>
#include<math.h>
#define MAXSOMMETS 50
 typedef struct{
int x;
int y;
}Point;
==



tests== 
[ ["Simple", "1 1 1 1 1 1", ""],
	["Nul1", "1 1 0 1 -1 1", ""],
  ["Nul2", "-2 1 1 1 1 1", ""],
  ["vecteurs aléatoires", " ".join([str(random.randint(-10,10)) for i in range(6)]), "" ],
  ["vecteurs aléatoires", " ".join([str(random.randint(-10,10)) for i in range(6)]), "" ],
  ["vecteurs aléatoires", " ".join([str(random.randint(-10,10)) for i in range(6)]), "" ],
  ["vecteurs aléatoires", " ".join([str(random.randint(-10,10)) for i in range(6)]), "" ] ]
==




