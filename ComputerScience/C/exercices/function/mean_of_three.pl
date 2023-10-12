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

author=Nicolas Borie

title=La moyenne de trois entiers
tag=function


text==#|markdown|
Écrire une fonction **mean_of_3** qui prend trois entiers en
paramètres et retourne la moyenne (de type double) de ces trois entiers.
==

editor.code==
... mean_of_3(...){
  ...
}
==

solution==#|c|

double mean_of_3(int a, int b, int c)
{
  return (a+b+c)/3.0;
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

  printf("La moyenne de %d, %d et %d est : %f\n", a, b, c, mean_of_3(a, b, c));
  
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


