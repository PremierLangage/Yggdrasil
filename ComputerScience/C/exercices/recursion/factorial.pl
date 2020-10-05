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

title=Factorielle d'un entier positif
tag=fonction|recursion|arithmétique

text==

La factorielle d'un entier positif $% n %$ est par convention $% 1 %$
si $% n = 0 %$ et le produit de tous les entiers strictement positifs
inférieur ou égal à $% n %$ sinon.

La factorielle d'un entier $% n %$ est noté $% n! %$ et est donc égal à 
$% n! := 1 \times 2 \times 3 \times \dots \times (n-1) \times n %$

Les premières valeurs sont ainsi :
    
$% 0! = 1 \qquad 1! = 1 \qquad 2! = 2 \qquad 3! = 6 \qquad 4! = 24 \qquad 5! = 120 %$

De manière récursive : la factorielle de $% 0 %$ vaut $% 1 %$ et pour
tout $% n > 0 %$, on a $% n! = n \times (n-1)! %$.

Complètez la fonction ci-dessous de manière à ce qu'elle retourne la
factorielle de $% n %$ en utilisant la valeur de factorielle de $% n-1
%$.    
==

editor.code==#|c|
int factorial(int n){
  ...
}
==

solution==#|c|
int factorial(int n){
  if (n==0)
    return 1;
  return n*factorial(n-1);
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdlib.h>
#include <stdio.h>    
    
int main(int argc, char* argv[]){
  int n = atoi(argv[1]);
  printf("%d! = %d\n", n, factorial(n));
  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["0"], ""],
 ["Petit test", ["1"], ""],
 ["Test moyen", ["5"], ""],
 ["Test aléatoire 1", [str(randint(1, 2))], ""],
 ["Test aléatoire 2", [str(randint(3, 5))], ""],
 ["Test aléatoire 3", [str(randint(6, 7))], ""],
 ["Test aléatoire 4", [str(randint(8, 9))], ""],
 ["Test aléatoire 5", [str(randint(10, 12))], ""]]
==


