#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Fonction d'Ackermann
tag=function|recursion

text==#|markdown|
La fonction d'Ackermann est une fonction récursive à deux paramètres
entiers positifs. Elle peut être définie comme il suit :

$% A(m, n) := 
\left\\{
\begin{array}{ll}
n + 1 & \text{ si } m = 0 \\newline
A(m-1, 1) & \text{ si } m > 0 \text{ et } n = 0 \\newline
A(m-1, A(m, n-1)) & \text{ si } m > 0 \text{ et } n > 0 \\newline
\end{array}
\\right.
%$

Complèter la fonction ci-dessus de manière à ce qu'elle retourne la
valeur de la fonction d'Akermann associée aux deux paramètres *m* et *n*.
==

editor.code==#|c|
int ackermann(int m, int n){
  ...
}
==

solution==#|c|
int ackermann(int m, int n){
  if (m == 0)
    return n+1;
  if (n == 0)
    return ackermann(m-1, 1);
  return ackermann(m-1, ackermann(m, n-1));
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdlib.h>
#include <stdio.h>    
    
int main(int argc, char* argv[]){
  int m = atoi(argv[1]);
  int n = atoi(argv[2]);    
  printf("Ackermann(%d, %d) : %d\n", m, n, ackermann(m, n));
  return 0;
}
==

checks_args_stdin==#|python|
[["Basique", ["0", "0"], ""], 
 ["Moyen", ["2", "2"], ""],
 ["Gros", ["3", "5"], ""],
 ["Aléatoire", [str(randint(0, 1)), str(randint(0, 100))], ""],
 ["Aléatoire", [str(randint(0, 2)), str(randint(0, 20))], ""],
 ["Aléatoire", [str(randint(0, 3)), str(randint(0, 4))], ""],
 ["Aléatoire", [str(randint(0, 3)), str(randint(0, 4))], ""]]
==


