#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Emplacement du maximum dans un tableau à trois dimensions

tag=tableau|fonction|parcours|complexe|dimension|pointeur

author=Nicolas Borie

text==#|markdown|
Écrire une fonction   
`int index_max_3d(int t[M][M][M], int s1, int s2, int s3, int* m1, int* m2, int* m3)`   
qui prend en argument un tableau à trois dimension `t`, puis trois entiers pour délimiter une zone de travail,
et enfin trois pointeurs vers un entier. Votre fonction devra rechercher les coordonnées du 
maximum `(i, j, k)` où `i` est compris entre `0` et `s1-1` (tous deux inclus), 
`j` est compris entre `0` et `s2-1` (tous deux inclus) et `k` est compris entre 
`0` et `s3-1` (tous deux inclus). Dans le cas où l'élément maximal serait présent plusieurs
fois, on recherchera l'occurence de coordonnées `(i, j, k)` minimales pour l'ordre lexicographique.
Une fois l'occurence trouvée, mettez à jour les trois pointeurs `(m1, m2, m3)` pour qu'ils 
pointent vers ces trois coordonnées. Finalement, retournez la valeur maximale du tableau de 
la zone de recherche.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>

#define M 20
==

editor.code==#|c|
int index_max_3d(int t[M][M][M], int s1, int s2, int s3, int* m1, int* m2, int* m3){
  // Votre code ici...
} 
==

solution==#|c|
int index_max_3d(int t[M][M][M], int s1, int s2, int s3, int* m1, int* m2, int* m3){
  int i, j, k;
  *m1 = *m2 = *m3 = 0;

  for (i=0 ; i<s1 ; i++){
    for (j=0 ; j<s2 ; j++){
      for (k=0 ; k<s3 ; k++){
        if (t[i][j][k] < t[*m1][*m2][*m3]){
          *m1 = i;
          *m2 = j;
          *m3 = k;
        }
      }
    }
  }
  return t[*m1][*m2][*m3];
}
==

code_after==#|c|

int main(int argc, char* argv[]){

  return 0;
}
==


checks_args_stdin==#|python|
[ ["Simple éxécution", ["2", "2", "2"],""] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

