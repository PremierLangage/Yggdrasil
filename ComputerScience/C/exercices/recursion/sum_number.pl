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

title=Somme récursive des chiffres d'un grand entier
tag=fonction|recursion|arithmétique

text==
Écrire une fonction récursive qui prend en argument un **entier long 
non signé** et  qui calcule la somme des chiffres
apparaissant dans ce nombre écrit en base $% 10 %$. Mais cette somme 
de chiffres est à réitérer jusqu'à qu'il ne reste plus qu'un seul chiffre.

Voici un exemple, pour le nombre 9754916347, votre fonction devra retourner 3.
Pourquoi 3, et bien parce que :

<br />

    975491634 --> 9 + 7 + 5 + 4 + 9 + 1 + 6 + 3 + 4 = 48
    48 --> 4 + 8 = 12
    12 --> 1 + 2 = 3 (un seul chiffre)

Pour cette exemple, il a fallut opérer trois passes de somme des chiffres 
avant de n'avoir plus qu'un seul chiffre.
Il ne faut pas hésiter à le code en plusieurs fonctions.

<br />
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
  unsigned long int n = strtol(argv[1], NULL, 10);

  printf("La somme des chiffres récursive de %lu est %lu.\n", n, sum_number_rec(n));
  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["0"], ""],
 ["Petit test", ["7"], ""],
 ["Test pLein", ["1234567"], ""],
 ["Test exemple", ["975491634"], ""],
 ["Test aléatoire 1", [str(randint(1, 2000000000))], ""],
 ["Test aléatoire 2", [str(randint(1, 2000000000))], ""],
 ["Test aléatoire 3", [str(randint(1, 2000000000000000000))], ""],
 ["Test aléatoire 4", [str(randint(1, 2000000000000000000))], ""],
 ["Test aléatoire 5", [str(randint(1, 2000000000000000000))], ""]]
==

