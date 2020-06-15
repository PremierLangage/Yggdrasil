
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
d'un entier `nombre`, le nombre effectif de points<br>

Ecrire une fonction `perimetre` qui recoit un polygone et renvoie son périmetre
==

editor.code==

  
==

solution==


==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include<math.h>
typedef struct{
int x;
int y;
}
==

codeafter==

 
int main(int argc, char* argv[]){

  Vector3d u = {atoi(argv[1]), atoi(argv[2]), atoi(argv[3])};
  Vector3d v = {atoi(argv[4]), atoi(argv[5]), atoi(argv[6])};

  printf("<(%d, %d, %d), (%d, %d, %d)> = %f\n", u.x, u.y, u.z, 
                                                v.x, v.y, v.z, 
                                                sqrt(scalar_product3d(u, v)));
  return 0;
}

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




