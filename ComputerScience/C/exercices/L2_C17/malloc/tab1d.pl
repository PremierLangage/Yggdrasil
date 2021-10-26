#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Allocation d'un tableau à une dimension
tag=tableau|malloc|simple|type


text==
Écrire une fonction C **allocate_float_array** qui prend en argument une 
taille **size** (sous la forme d'un entier) et qui retourne un tableau 
pouvant contenir **size** flottants simple précision. L'adresse retournée
devra avoir été obtenue à l'aide de la fonction **malloc**.

<br>

Pour rappel, un code verbeux et de qualité présente des cast devant les 
retours de malloc avant affectation. Aussi, l'opérateur **sizeof** est 
plus lisible et plus prévisible lorsqu'il est utilisé sur des types (et 
pas sur des expressions).


==

editor.code==#|c|
... allocate_float_array(...){
    // Votre code ici...
}
==

solution==#|c|
float* allocate_float_array(int size){
  float* ans = (float *)malloc( size * sizeof(float) );
  return ans;
}
==

code_before==#|c|
#include <stdlib.h>
==

code_after==#|c|
#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  int size = atoi(argv[1]);
  float* ans;

  srand(time(NULL));

  ans = allocate_float_array(size);
  if (ans == NULL){
    printf("Not Enough Memory.\n");
    return 0;
  }
  if (size >= 2){
    ans[0] = rand();
    ans[size-1] = rand();
    printf("Allocation et utilisation : %f (devrait valoir zéro...)\n", ans[size-1] - ans[size-1]);
  }
  free(ans);
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Tableau vide", ["0"], ""],
 ["Tableau moyen", ["46"], ""],
 ["Test aléatoire 1", [str(randint(1, 10000))], ""],
 ["Test aléatoire 2", [str(randint(1, 1000000))], ""],
 ["Test aléatoire 3", [str(randint(10000000, 20000000))], ""]]
==

astuces==#|python|
[
  { "content": """Il s'agit ici du premier exercice d'application du cours. Un simple appel à `malloc` doit suffire."""},
  { "content": """L'unique appel à `malloc` doit avoir les bons arguments (il ne faut jamais oublier de multiplier le nombre d'éléments voulus par la taille d'un élément)."""}
]
==
