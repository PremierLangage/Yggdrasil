#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
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

author=Dominique Revuz

title=Maximum de trois entiers
tag=function|if|test|comparaison


text==
Écrire une fonction **max_of_three** qui prend trois entiers en
paramètres et retourne le maximum de ces trois entiers.
==

editor.code==#|c|
... max_of_three(...){
  ...
}
==

solution==#|c|
int max_of_three(int a, int b, int c){
  if (a>=b) { 
      if (c>=a) return c;
      else return a;
      }
    else {
        if (c>=b) return c;
        else 
        return b;
    }
}
==

code_before==

==

code_after==#|c|
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("Le maximum entre %d, %d et %d est : %d\n", a, b, c, max_of_three(a, b, c));
  
  return 0;
}
==


checks_args_stdin==#|python|
[ ["Basique", ["3", "2", "1"], ""],
  ["Égaux", ["10", "10", "10"], ""],
  ["Négatif", ["12", "-6", "3"], ""],
  ["Aléatoire", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Aléatoire", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Aléatoire", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Aléatoire", [str(randint(-1000, 1000)) for i in range(3)], ""] ]
==



