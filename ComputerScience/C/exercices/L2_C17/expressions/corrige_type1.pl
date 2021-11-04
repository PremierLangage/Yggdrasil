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

tag=C|type|division|erreur

text==#|markdown|
Le programme suivant comporte une erreur de type. Tentez de corriger cette erreur ! 
Attention, cette fonction étant intégrée dans un programme pour les tests, vous ne 
devez pas rendre la fonction inopérante.
==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>

==

editor.code==#|c|
float moyenne(int a, int b, int c){
    return (a+b+c) / 3;
}
==

solution==#|c|
float moyenne(int a, int b, int c){
    return (a+b+c) / 3.0;
}
==

code_after==#|c|

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("La moyenne de %d, %d et %d est : %f.\n", a, b, c, moyenne(a, b, c));

  return 0;
}
==


checks_args_stdin==#|python|
[ ["Simple éxécution", ["1", "1", "1"], ""],
  ["Premier problème", ["1", "1", "2"], ""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(3)],""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(3)],""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(3)],""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(randint(5, 10))],""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(randint(5, 10))],""],
  ["Test aléatoire", [str(randint(0, 50)) for i in range(randint(5, 10))],""] ]
==



