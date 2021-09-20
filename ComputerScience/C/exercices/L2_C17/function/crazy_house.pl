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

author=Nicolas Borie

title=La maison qui rend fou
tag=function|variable|output|sortie|affichage|boucle|precision

editor.height=350px

text==
Le but cet exercice est d'écrire une fonction `void maison(int n)` qui
dessine une maison de taille `n`.


    nborie@bayer:$ ./maison 1
    /\_
    |_|
    nborie@bayer:$ ./maison 2
     /\
    /  \__
    |    |
    |____|
    nborie@bayer:$ ./maison 3
      /\
     /  \
    /    \___
    |       |
    |       |
    |_______|
    nborie@bayer:$ ./maison 4
       /\
      /  \
     /    \
    /      \____
    |          |
    |          |
    |          |
    |__________|

Prennez le temps de bien regarder les exemples. L'exercice n'est pas
facille! Pour tout entier `n`, la flèche du toit est composé de `n`
slashs puis de `n` antislashs. La partie plate du toit est composé de
`n` underscorces. Les murs gauches et droits sont composés de `n`
pipes. La hauteur totale de la maison est de `2*n` caractères alors
que la largueur totale est de `3*n` caractères (épaisseurs des murs
comprises). Le placement des espaces et des retours chariots est
primordial. Le dessin ne comporte aucun espace superflu.
==

editor.code==#|c|
void maison(int n){
  /* Votre code ici... */
}
==

solution==#|c|
void maison(int n){
  int i, j;

  for (i=0 ; i<n ; i++){
    for (j=0 ; j<n-1-i ; j++)
      putchar(' ');
    putchar('/');
    for (j=0 ; j<2*i ; j++)
      putchar(' ');
    putchar('\\');
    if (i == n-1){
      for (j=0 ; j<n ; j++)
	putchar('_');	
    }
    putchar('\n');
  }
  for (i=0 ; i<n-1 ; i++){
    putchar('|');
    for (j=0 ; j<3*n-2 ; j++)
      putchar(' ');
    putchar('|');
    putchar('\n');
  }
  putchar('|');
  for (j=0 ; j<3*n-2 ; j++)
    putchar('_');
  putchar('|');
  putchar('\n');
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int n=atoi(argv[1]);

  maison(n);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["1"], ""],
  ["Test basique", ["2"], ""],
  ["Test basique", ["3"], ""],
  ["Test basique", ["4"], ""],
  ["Test basique", ["5"], ""],
  ["Test aléatoire 1", [str(randint(6,8))], ""],
  ["Test aléatoire 2", [str(randint(9,11))], ""],
  ["Test aléatoire 3", [str(randint(12,14))], ""] ]
==



