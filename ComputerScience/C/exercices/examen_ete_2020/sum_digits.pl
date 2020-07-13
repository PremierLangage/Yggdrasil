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
title=Somme des chiffres d'un nombre
tag=function|recursion|array

editor.height=300px

text==
Écrire une fonction C **mean_positive** qui prend en argument un tableau d'entiers 
**array** ainsi que sa taille **size**. Votre fonction devra retourner la moyenne
des éléments positifs ou nuls contenus dans le tableau. Cette moyenne devra être
calculée et retournée dans les floattants C. Si le tableau ne contient aucun 
élément positifs ou nuls, votre fonction devra alors retourner zéro (dans les 
flottants encore).
==

checks_args_stdin==#|python|
[["Basique", ["0"], ""],
 ["Petit", ["7"], ""],
 ["PLein", ["1234567"], ""],
 ["Aléatoire", [str(random.randint(1, 2000000000))], ""],
 ["Aléatoire", [str(random.randint(1, 2000000000))], ""],
 ["Aléatoire", [str(random.randint(1, 2000000000))], ""],
 ["Aléatoire", [str(random.randint(1, 2000000000))], ""],
 ["Aléatoire", [str(random.randint(1, 2000000000))], ""]]
==

editor.code==#|c|
int sum_number(int n){
  /* Votre code ici... */
}
==

solution==#|c|
int sum_number(int n){
  if (n<10)
    return n;
  return sum_number(n/10) + (n%10);
}
==

codeafter==#|C|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int n = atoi(argv[1]);

  printf("La somme des chiffres de %d est %d.\n", n, sum_number(n));
  return 0;
}
==

