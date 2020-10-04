#*****************************************************************************
#  Copyright (C) 2018 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Zone contiguë dans une matrice
tag=fonction|recursion|array|matrice|difficile

text==
On souhaite écrire une fonction qui calcule la taille d'une zone de
couleur semblable à l'intérieur de matrices carrées de nombres. Il 
faut voir cette matrice d'entiers comme un carré de pixels où chaque 
couleur est encodée par un petit nombre entier.

Voici un exemple : prenons comme couleur $% 1, 2, 3, 4, 5 %$ et comme
matrice *mat* de type `int[5][5]`.

$%
\begin{array}{ccccc}
5 & 1 & 3 & 1 & 4 \\newline
1 & 1 & 4 & 1 & 3 \\newline
4 & 1 & 3 & 2 & 1 \\newline
3 & 1 & 1 & 1 & 4 \\newline
3 & 1 & 3 & 1 & 2 \\newline
\end{array}
%$

On remarque que `mat[0][0]` vaut 5 ou encore `mat[0][2]`
vaut 3. Chaque case à au plus 4 voisins (au dessus, en dessous, à
gauche et à droite). Les cases des bords et des coins ont moins de
voisins que les cases centrales.


On veut maintenant écrire une fonction qui explore une zone contiguë
(constituée de cases successivement voisines) de même couleur. La
fonction prendra en argument la matrice ainsi que les coordonnées
d'une case. En partant de cette case, la fonction devra retourner le
nombre de cases contiguës de même couleur à laquelle appartient la
case originelle (comme les fonctions de coloriages de zones dans les 
petits utilitaires de dessin).


Avec la matrice *mat* et les coordonnées *(3, 2)*, la fonction devra
retourner *9*. Durant l'appel au départ, on lit la couleur de la case
de départ, ici c'est la case de coordonnées 3 et 2 (donc quatrième
ligne et troisième colonne). Il y a la couleur $% 1 %$ dans cette
case. Une fois visité et pour être sûr de ne pas y revenir, on placera
la couleur $% 0 %$ (la case sera ainsi marqué comme vue).


$%
\begin{array}{ccccc}
5 & 1 & 3 & 1 & 4 \\newline
1 & 1 & 4 & 1 & 3 \\newline
4 & 1 & 3 & 2 & 1 \\newline
3 & 1 & {\color{red}0} & 1 & 4 \\newline
3 & 1 & 3 & 1 & 2 \\newline
\end{array}
%$


Ensuite une fonction récursive interne prend le relai pour explorer
récursivement les voisins quand ils existent. Au final, la zone suivante est explorée :

$%
\begin{array}{ccccc}
5 & {\color{red}0} & 3 & 1 & 4 \\newline
{\color{red}0} & {\color{red}0} & 4 & 1 & 3 \\newline
4 & {\color{red}0} & 3 & 2 & 1 \\newline
3 & {\color{red}0} & {\color{red}0} & {\color{red}0} & 4 \\newline
3 & {\color{red}0} & 3 & {\color{red}0} & 2 \\newline
\end{array}
%$

Cette zone contient des cases successivement voisines et elles étaient
toutes de couleur $% 1 %$ qui est la couleur de la case originelle aux
coordonnées *(3, 2)*. Ainsi, ici la réponse devrait être $% 9 %$.
Attention, les cases en diagonales ne sont pas voisines !

==

editor.code==#|c|
/* Retourne la taille de la zone contigue de même couleur */
/* issue de la case (x, y). */
int size_aera_color(int** mat, int size_mat, int x, int y){
  return size_aera_color_rec(mat, size_mat, x, y, mat[x][y]);
}

/* Fonction recursive comptant le nombre de cases valide */
/* dans la zone. */
int size_aera_color_rec(int** mat, int size_mat, int x, int y, int color){
  ...
  ... /* 4 appels recursifs attendus */
  ...
}
==

solution==#|c|
int size_aera_color(int** mat, int size_mat, int x, int y){
  return size_aera_color_rec(mat, size_mat, x, y, mat[x][y]);
}

int size_aera_color_rec(int** mat, int size_mat, int x, int y, int color){
  int total=1;

  if (mat[x][y] != color)
    return 0;
  mat[x][y] = 0;
  if (x > 0)
    total += size_aera_color_rec(mat, size_mat, x-1, y, color);
  if (x < size_mat-1)
    total += size_aera_color_rec(mat, size_mat, x+1, y, color);
  if (y > 0)
    total += size_aera_color_rec(mat, size_mat, x, y-1, color);
  if (y < size_mat-1)
    total += size_aera_color_rec(mat, size_mat, x, y+1, color);
  return total;
}
==


code_before==#|c|
int size_aera_color(int** mat, int size_mat, int x, int y);
int size_aera_color_rec(int** mat, int size_mat, int x, int y, int color);
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int** fill_mat(int size){
  int i, j;
  int** mat;

  mat = (int**)malloc(size*sizeof(int*));
  for (i=0 ; i<size ; i++){
    mat[i] = (int*)malloc(size*sizeof(int));
    for (j=0 ; j<size ; j++){
      scanf("%d", &(mat[i][j]));
    }
  }
  return mat;
}

void print_mat(int** mat, int size){
  int i,j;

  for (i=0 ; i<size ; i++){
    for (j=0 ; j<size ; j++){
      printf("%d ", mat[i][j]);
    }
    printf("\n");
  }
}

int main(int argc, char* argv[]){
  int size = atoi(argv[1]);
  int x = atoi(argv[2]);
  int y = atoi(argv[3]);
  int** mat;
  int taille;
  
  mat = fill_mat(size);

  taille = size_aera_color(mat, size, x, y);
  print_mat(mat, size);
  printf("La taille de la zone issue de la case (%d, %d) est %d.\n", x, y, taille);

  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["1", "0", "0"], "1"],
 ["Mini test", ["2", "1", "1"], "2 1\n 1 1"],
 ["Test pLein", ["5", "4", "1"], "2 2 2 2 2\n 2 2 2 2 2\n 2 2 2 2 2\n 2 2 2 2 2\n 2 2 2 2 2"],
 ["Avec des trous", ["5", "2", "2"], "1 2 2 2 1\n 2 2 2 2 2\n 2 1 2 1 2\n 2 2 2 2 2\n 2 1 2 1 2"],
 ["Test carré", ["5", "3", "0"], "3 3 3 3 3\n 3 1 2 5 3\n 3 1 3 4 3\n 3 2 5 4 3\n 3 3 3 3 3"],
 ["Avec un damier", ["5", "4", "1"], "2 1 2 1 2\n 1 2 1 2 1\n 2 1 2 1 2\n 1 2 1 2 1\n 2 1 2 1 2"],
 ["Test en taille 6", ["6", "0", "3"], "2 3 2 4 2 4\n 2 4 4 4 2 5\n 2 4 2 3 2 1\n 3 3 3 2 2 5\n 1 2 4 3 4 3"],
 ["Test aléatoire", ["10", str(randint(1,9)), str(randint(1,9))], "\n".join([" ".join([str(randint(1, 2)) for i in range(10)]) for j in range(10)])] ]
==


