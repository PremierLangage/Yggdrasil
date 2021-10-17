#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie 

title=Produit scalaire de vecteurs en dimension 3

tag=structure|function|produit|simple

text==#|markdown|
Le produit scalaire $%\langle u, v \rangle%$ de deux vecteurs $%u = (x_u, y_u, z_u)%$ et 
$%v = (x_v, y_v, z_v)%$ est donné par la formule 
$% \langle u, v \rangle = x_u \times x_v + y_u \times y_v + z_u \times z_v%$.

<br />

Suivant la structure C qui vous est fournie, ecrire une fonction
*scalar_product3d* qui retourne le produit scalaire de deux vecteurs
de type *Vector3d* passés par adresse.
    
==

editor.code==#|c|
typedef struct vector3d{
  int x;
  int y;
  int z;
}Vector3d;

... scalar_product3d(...){
  /* Votre code ici */
}
==

solution==#|c|
typedef struct vector3d{
  int x;
  int y;
  int z;
}Vector3d;

int scalar_product3d(Vector3d* u, Vector3d* v){
  return u->x*v->x + u->y*v->y + u->z*v->z;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){

  Vector3d u = {atoi(argv[1]), atoi(argv[2]), atoi(argv[3])};
  Vector3d v = {atoi(argv[4]), atoi(argv[5]), atoi(argv[6])};

  printf("<(%d, %d, %d), (%d, %d, %d)> = %d\n", u.x, u.y, u.z, 
                                                v.x, v.y, v.z, 
                                                scalar_product3d(&u, &v));
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test simple", ["1", "1", "1", "1", "1", "1"], ""],
	["Vecteurs orthogonaux", ["1", "1", "0", "1", "-1", "1"], ""],
  ["Vecteurs orthogonaux 2", ["-2", "1", "1", "1", "1", "1"], ""],
  ["Test aléatoire 1", [str(randint(-10,10)) for i in range(6)], "" ],
  ["Test aléatoire 2", [str(randint(-10,10)) for i in range(6)], "" ],
  ["Test aléatoire 3", [str(randint(-10,10)) for i in range(6)], "" ],
  ["Test aléatoire 4", [str(randint(-10,10)) for i in range(6)], "" ] ]
==




