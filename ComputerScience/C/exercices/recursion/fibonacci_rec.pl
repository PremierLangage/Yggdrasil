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

title=Fibonacci récursif très naïf
tag=fonction|recursion|suite|simple

text==
On peut définir les nombres de Fibonacci de manière récursive comme il suit :

$%
fibonacci(n) :=    
\left\\{ 
\begin{array}{ll}
1 & \text{ si } n = 0 \\newline
1 & \text{ si } n = 1 \\newline
fibonacci(n-1) + fibonacci(n-2) & \text{ si } n > 1 \\newline
\end{array}
\\right.
%$

Avec cette simple définition, on peut coder une fonction récursive
retournant le $% n^{ième} %$ nombre de Fibonacci.

Attention, cette approche est très naïve et un grand nombre d'appels
récursifs peuvent être générés. Toutefois, vous devriez obtenir
quelque chose de fonctionnel.

Complètez la fonction suivante de manière à ce qu'elle retourne le 
$% n^{ième} %$ nombre de Fibonacci.
==

editor.code==#|c|
int fibonacci(int n){
  ...
}
==

solution==#|c|
int fibonacci(int n){
    if (n < 2)
	return 1;
    return fibonacci(n-1) + fibonacci(n-2);
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int n = atoi(argv[1]);

  printf("Fibonacci(%d) = %d\n", n, fibonacci(n));
    
  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["0"], ""],
 ["Premier test", ["1"], ""],
 ["Second test", ["2"], ""],
 ["Test aléatoire 1", [str(randint(3,6))], ""],
 ["Test aléatoire 2", [str(randint(6, 9))], ""],
 ["Test aléatoire 3", [str(randint(9, 12))], ""],
 ["Test aléatoire 4", [str(randint(12, 15))], ""]]
==

