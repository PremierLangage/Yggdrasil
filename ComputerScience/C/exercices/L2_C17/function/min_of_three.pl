#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Minimum de trois entiers
tag=function

text==#|markdown|
Écrire une fonction **min_of_three** qui prend trois entiers en
paramètres et retourne le minimum de ces trois entiers.

==

editor.code==#|c|
... min_of_three(...){
  ...
}
==

solution==#|c|

int min_of_three(int a, int b, int c){
  if (a <= b){
    if (a <= c)
      return a;
    return c;
  }
  if (b <= c)
    return b;
  return c;
}

==

code_before==#|c|

==

code_after==#|c|
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("Le minimum entre %d, %d et %d est : %d\n", a, b, c, min_of_three(a, b, c));
  return 0;
}
==


checks_args_stdin==#|python|
[ ["Test basique", ["3", "2", "1"], ""],
  ["Égalité parfaite", ["10", "10", "10"], ""],
  ["Un négatif", ["12", "-6", "3"], ""],
  ["Test aléatoire 1", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Test aléatoire 2", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Test aléatoire 3", [str(randint(-1000, 1000)) for i in range(3)], ""],
  ["Test aléatoire 4", [str(randint(-1000, 1000)) for i in range(3)], ""] ]
==


astuces==#|python|
[
  { "content": """Cette fonction peut s'écrire avec trois conditionnelles du type `if ... else ...` correctement imbriquées."""},
  { "content": """Il faut prévoir tous les cas, il n'y a pas vraiment de stratégie plus rapide."""},
  { "content": """La bonnne structuration est la suivante :\n\n    if (...){\n      if(...)\n        return ...\n      else\n        return ...\n    }\n    else{\n      if(...)\n        return ...\n      else\n        return ...\n    }\n"""}
]
==


