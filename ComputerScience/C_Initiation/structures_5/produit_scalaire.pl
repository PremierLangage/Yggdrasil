
# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Produit scalaire de vecteurs 3D

author=   
title=Produit scalaire de vecteurs en dimension 3
tag=structure|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Le produit scalaire $%\langle u, v \rangle%$ de deux vecteurs $%u = (x_u, y_u, z_u) %$ et 
$%v = (x_v, y_v, z_v$)%$ est donné par la formule 
$% \langle u, v \rangle = x_u \times x_v + y_u \times y_v + z_u \times z_v%$.

<br />

Suivant la structure C qui vous est fournie, écrire une fonction
*scalar_product3d* qui retourne le produit scalaire de deux vecteurs
de type *Vector3d* passés par adresse.
    
==

editor.code==
typedef struct vector3d{
  int x;
  int y;
  int z;
}Vector3d;

... scalar_product3d(...){
  /* Votre code ici */
}
  
==

solution==

typedef struct vector3d{
  int x;
  int y;
  int z;
}Vector3d;

int scalar_product3d(Vector3d u, Vector3d v){
  return u.x*v.x + u.y*v.y + u.z*v.z;
}

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==


codeafter==

 
int main(int argc, char* argv[]){

  Vector3d u = {atoi(argv[1]), atoi(argv[2]), atoi(argv[3])};
  Vector3d v = {atoi(argv[4]), atoi(argv[5]), atoi(argv[6])};

  printf("<(%d, %d, %d), (%d, %d, %d)> = %d\n", u.x, u.y, u.z, 
                                                v.x, v.y, v.z, 
                                                scalar_product3d(u, v));
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





