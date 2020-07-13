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
Écrire une fonction **sum_number** qui prend en argument un entier C (qui 
sera toujours positif) et qui retourne la somme des chiffres qui compose
ce nombre quand on l'écrit en base 10.

Voici quelques exemples :

    sum_number(7)         retourne 7
    sum_number(11111111)  retourne 8
    sum_number(1234)      retourne 10
    sum_number(999)       retourne 27
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

