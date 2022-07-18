#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Programme erroné manipulant des types

tag=C|type|overflow|multiplication

text==#|markdown|

Le programme suivant comporte une erreur de type. Tentez de corriger cette erreur !

==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>

==

editor.code==#|c|
int multiplication(int a, int b){
  return a*b;
}
==

solution==#|c|

long int multiplication(int a, int b){
  return ((long int)a)*b;
}
==

code_after==#|c|

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf("Le produit %d x %d vaut %ld.\n", a, b, (long int)multiplication(a, b));
  return 0;
}
==


checks_args_stdin==#|python|
[ ["Simple éxécution", ["1", "1"], ""],
  ["Cinq au carré", ["5", "5"], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""],
  ["Test aléatoire", [str(randint(0,2000000000)) for i in range(2)], ""] ]
==




