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

title=Tracer les appels d'une fonction récursive
tag=trace|récursion|fibonacci|macro|pile|appel

text==

Écrire une macro **TRACE** qui prend en paramètre un entier **a** et
qui affiche `fibo a : ` (avec a substitué par sa valeur entière) 
puis **a** fois le caractère X avant de retourner à la 
ligne. Par exemple, TRACE(4) doit afficher :

<br>

    fibo 4 : XXXX

Cette macro sera ensuite utiliser pour faire une trace en 
ascii art de l'exécution d'un Fibonacci fortement récursif.

==

editor.code==#|c|
#include <stdio.h>

#define TRACE(a) ...

int fibo(int n){
  TRACE(n)
  if (n <= 1)
    return 1;
  return fibo(n-1) + fibo(n-2);
}
==

solution==#|c|
#include <stdio.h>

int zeubi;

#define TRACE(a) printf("fibo %d : ", a); for(zeubi=0 ; zeubi<a ; zeubi++){putchar('X');} putchar('\n');

int fibo(int n){
  TRACE(n)
  if (n <= 1)
    return 1;
  return fibo(n-1) + fibo(n-2);
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdlib.h>


int main(int argc, char* argv[]){
  fibo(atoi(argv[1]));
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["0"], ""],
  ["Premiers appels récursifs", ["2"], ""],
  ["Test Moyen", ["4"], ""],
  ["Test aléatoire 1", [str(randint(5,6))] , ""],
  ["Test aléatoire 2", [str(randint(7,8))] , ""] ]
==

