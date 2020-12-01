#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Macro pour calculer un carré
tag=macro|carré|piège|parenthèse|priorité

text==
Écrire une macro à paramètre **SQUARE** qui prend en argument un seul paramètre 
(jamais typé comme c'est toujours le cas pour les macros) et qui remplacera 
ces appels par le carré (via une simple multiplication) de son paramètre. 
Le paramètre de la macro sera toujours une expression C qui s'évalue dans 
un type numérique.

==

editor.code==#|c|
#define SQUARE....

==

solution==#|c|
#define SQUARE(a) ((a)*(a))

==

codeafter==#|c|
 
#include <stdio.h>

int main(int argc, char* argv[]){

  printf("Le carré de %d est %d\n", 0, SQUARE(0));
  printf("Le carré de %d est %d\n", 1, SQUARE(1));
  printf("Le carré de %d est %d\n", 12, SQUARE(12));
  printf("Le carré de %s est %d\n", "1+2", SQUARE(1+2));
  printf("Le carré de %s est %d\n", "2-1", SQUARE(2-1));
  printf("Le carré de %f est %f\n", 3.14, SQUARE(3.14));
  return 0;
}

==

checks_args_stdin==#|python|
[ ["Expressions classiques", "",""] ]
==



