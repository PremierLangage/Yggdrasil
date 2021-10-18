#*****************************************************************************
#  Copyright (C) 2017 Elise Hardy <ehardy@etud.u-pem.fr>
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

author=Elise Hardy

title=Structure contenant une autre structure
tag=structure|imbriquées|simple

text==
Déclarez et définissez une structure **Point** contenant deux champs entiers nommés *x* et *y*.
Puis une autre structure **Couple** contenant deux de type **Point** nommés *p1* et *p2*.

==

editor.code==#|c|
typedef ...
==

solution==#|c|
typedef struct {
    int x;
    int y;
}Point;

typedef struct {
    Point p1;
    Point p2;
}Couple;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
    
int main(int argc, char* argv[]){
  Couple c;
  c.p1.x=atoi(argv[1]);
  c.p1.y=c.p2.x=atoi(argv[2]);
  c.p2.y=atoi(argv[3]);
  printf("Couple point 1 (%d %d) point 2 (%d %d)\n", c.p1.x, c.p1.y, c.p2.x, c.p2.y);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation 1", ["14", "3", "42"], ""],
  ["Déclaration et utilisation 2", ["47", "85", "913"], ""],
  ["Test aléatoire", [str(randint(0,99)) for i in range(3)], ""] ] 
==



