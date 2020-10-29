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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Allocation triangulaire
tag=allocation|function

text==
Écrire une fonction C **triangle** qui prend en argument un entier (qui sera 
toujours strictement positif). Votre fonction devra allouer un tableau à 
deux dimensions de forme triangulaire. Voici un exemple pour la taille 5 :

    X               ( première ligne [0] : 1 élément )
    X  X            (  seconde ligne [1] : 2 éléments)
    X  X  X         (troisième ligne [2] : 3 éléments)
    X  7  X  X      (   l'elément [3][1] vaut ici 7  )
    X  X  X  X  X   (cinquième ligne [4] : 5 éléments)

Votre fonction devra donc retourner un tableau doublement indéxé `[i][j]` 
(i pour les lignes et j pour les colonnes). La première ligne peut contenir
1 élément, la seconde ligne 2 éléments, etc... En taille **n**, le tableau
retourné et fraichement alloué contiendra **n** lignes.
==

editor.code==#|c|
#include ...

int** triangle(int n){
  /* Votre code ici... */
}
==

solution==#|c|
#include <stdlib.h>

int** triangle(int n){
  int** tab = (int**)malloc(sizeof(int*) * n);
  int i;

  for(i=0 ; i<n ; i++){
    tab[i] = (int*)malloc(sizeof(int) * (i+1));
  }
  return tab; 
}
==

code_before==#|c|
#include <stdio.h>
==

code_after==#|c|

int main(int argc, char* argv[]){
  int taille = atoi(argv[1]);
  int** tab = triangle(taille);
  int i, j;

  for (i=0 ; i<taille ; i++){
    tab[i][0] = 1;
    tab[i][i] = 1;
  }
  for (i=1 ; i<taille ; i++){
    for (j=1 ; j<i ; j++){
      tab[i][j] = tab[i-1][j] + tab[i-1][j-1];
    }
  }
  for (i=0 ; i<taille ; i++){
    for (j=0 ; j<i+1 ; j++){
      printf("%d ", tab[i][j]);
    }
    putchar('\n');
  }
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["5"], ""],
 ["Taille minimale", ["1"], ""],
 ["Test aléatoire 1", [str(randint(2, 12))], ""],
 ["Test aléatoire 2", [str(randint(2, 12))], ""],
 ["Test aléatoire 3", [str(randint(2, 12))], ""],
 ["Test aléatoire 4", [str(randint(2, 12))], ""],
 ["Test aléatoire 5", [str(randint(2, 12))], ""],
 ["Test aléatoire 6", [str(randint(2, 12))], ""]]
==

# tests.test1.editor.code==
# #include <stdlib.h>
# 
# int** triangle(int n){
#   int** tab = (int**)malloc(sizeof(int*) * n);
#   int i;
# 
#   for(i=0 ; i<n ; i++){
#     tab[i] = (int*)malloc(sizeof(int) * (i+1));
#   }
#   return tab; 
# }
# ==
# tests.test1.grade=100

# tests== 
# {
# "1" : {
#     "editor" : {
#         "code" : "#include <stdlib.h>\n\nint** triangle(int n){\nint** tab = (int**)malloc(sizeof(int*) * n);\nint i;\n\nfor(i=0 ; i<n ; i++){\ntab[i] = (int*)malloc(sizeof(int) * (i+1));\n}\nreturn tab;\n}\n",
#         "grade" : "100"
#         }
#     }
# }
# ==

