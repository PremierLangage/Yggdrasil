
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

title=Somme des chiffres d'un nombre
tag=fonction|recursion|arithmétique

text==
Écrire une fonction récursive qui prend en argument un entier long 
non signé et  qui calcule la somme des chiffres
apparaissant dans ce nombre écrit en base $% 10 %$. Mais cette somme 
de chiffres est à réitérer jusqu'à qu'il ne reste qu'un seul chiffre.

Voici un exemple, pour le nombre 9754916347, votre fonction devra retourner 3.
Pourquoi 3, et bien parce que :

    9754916347 --> 9 + 7 + 5 + 4 + 9 + 1 + 6 + 3 + 4 = 48
    48 --> 4 + 8 = 12
    12 --> 1 + 2 = 3 (un seul chiffre)

Il ne faut pas hésiter à le code en plusieurs fonctions.
==

editor.code==#|c|
unsigned long int sum_number_rec(unsigned long int n){
  ...
}
==

solution==#|c|
unsigned long int sum_number(unsigned long int n){
  if (n<10)
    return n;
  return sum_number(n/10) + (n%10);
}

unsigned long int sum_number_rec(unsigned long int n){
  if (n == sum_number(n))
    return n;
  return sum_number_rec(sum_number(n));
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int n = atoi(argv[1]);

  printf("La somme des chiffres récursive de %d est %d.\n", n, sum_number_rec(n));
  return 0;
}
==



checks_args_stdin==#|python|
[["Test basique", "0", ""],
 ["Petit test", "7", ""],
 ["Test PLein", "1234567", ""],
 ["Test aléatoire", str(randint(1, 2000000000)), ""],
 ["Test aléatoire", str(randint(1, 2000000000)), ""],
 ["Test aléatoire", str(randint(1, 2000000000)), ""],
 ["Test aléatoire", str(randint(1, 2000000000)), ""],
 ["Test aléatoire", str(randint(1, 2000000000)), ""]]
==


