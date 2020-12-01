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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Macro minimum
tag=macro|condition|ternaire|paramètre


text==

Écrire une macro **MIN** à deux paramètres qui retourne le minimum de ces deux arguments.
Utilisez une condition de type ternaire pour définir votre macro et ne placer pas de
point virgule final.

==

editor.code==#|c|
#... MIN ...

==

solution==#|c|

#define MIN(a, b) (a) <= (b) ? (a) : (b) 

==


code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

==

code_after==#|c|

int main(int argc, char* argv[]){
  srand(atoi(argv[1]));

  printf("MIN(2, 4) = %d\n", MIN(2, 4));
  printf("MIN(2+2, 3-1) = %d\n", MIN(2+2, 3-1));
  printf("MIN(3.1415, 4.000001) = %f\n", MIN(3.1415, 4.000001));
  printf("Aléatoire : %d\n", MIN(rand(), rand()));
  printf("Aléatoire : %d\n", MIN(rand(), rand()));
  printf("MIN(aléa, MIN(aléa, aléa)) : %d\n", MIN(rand(), MIN(rand(), rand())));
  printf("MIN(aléa, MIN(aléa, aléa)) : %d\n", MIN(rand(), MIN(rand(), rand())));
  printf("MIN(MIN(aléa, aléa), MIN(aléa, aléa)) : %d\n", MIN(MIN(rand(), rand()), MIN(rand(), rand())));
  printf("MIN(MIN(aléa, aléa), MIN(aléa, aléa)) : %d\n", MIN(MIN(rand(), rand()), MIN(rand(), rand())));

  return 0;
}

==

checks_args_stdin==#|python|
[ ["Exécution simple", str(random.randint(0,1000000)),""] ]
==



