#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
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

author=Dominique Revuz

title=Mettre au cube une valeur pointée
tag=function|pointer|variable

text==
Écrire une function **cube_it** qui prend l'adresse d'un entier (pointeur vers 
un entier) et remplace la valeur pointée par son cube (c'est à dire l'ancienne 
valeur élevée à la puissance 3). Faire un choix cohérent pour le prototype de 
la fonction.
==

editor.code==
... cube_it(...){
  ...
}
==


solution==

void cube_it(int *p)
{
    *p = *p * *p * *p;
}

==

code_before==

#include <stdio.h>
#include <stdlib.h>

==

code_after==

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  cube_it(&a);
  printf("Cube --> %d\n",a);
  return 0;
}

==

checks_args_stdin==
[["Test basique", ["1"], ""],
 ["Simple nombre négatif", ["-3"], ""],
 ["Test aléatoire 1", [str(randint(1, 33))], ""],
 ["Test aléatoire 2", [str(randint(-50, -12))], ""],
 ["Test aléatoire 3", [str(randint(-100, 100))], ""],
 ["Test aléatoire 4", [str(randint(-100, 100))], ""]]
==



