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

title=Miroir sur les bits d'un octet
tag=bitwise|function|miroir|renversement|bit|octet

text==
Écrire une fonction C **bit_miror** qui prend en argument une
variable pointant sur un octet (faire un choix raisonnable) et retourne
une donnée de même type ayant pour valeur la même donnée binaire mais
dont les bits apparaissent dans l'ordre inverse que ceux de l'argument.

    1011 1001 --> 1001 1101
    0111 0101 --> 1010 1110
    1000 0001 --> 1000 0001
    1111 0000 --> 0000 1111
    0000 0000 --> 0000 0000


==

editor.code==#|c|
... bit_miror(...){
    /* Votre code ici */
}
==

solution==#|c|
unsigned char bit_miror(unsigned char a){
  unsigned char b = 0;

  b |= (a & 1) << 7;
  b |= (a & 2) << 5;
  b |= (a & 4) << 3;
  b |= (a & 8) << 1;

  b |= (a & 16) >> 1;
  b |= (a & 32) >> 3;
  b |= (a & 64) >> 5;
  b |= (a & 128) >> 7;
  return b;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
void print_bin(unsigned char s){
  int i;

  for(i=0 ; i<8 ; i++)
    printf("%c", (s & (1<<(7-i)))?'1':'0');
}

int main(int argc, char* argv[]){
  unsigned char s = atoi(argv[1]);

  print_bin(s);
  printf(" | ");
  print_bin(bit_miror(s));
  putchar('\n');

  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Bits nuls", ["0"], ""],
 ["Bits à 1", ["255"], ""],
 ["Test aléatoire 1", [str(randint(0,255))], ""],
 ["Test aléatoire 2", [str(randint(0,255))], ""],
 ["Test aléatoire 3", [str(randint(0,255))], ""],
 ["Test aléatoire 4", [str(randint(0,255))], ""],
 ["Test aléatoire 5", [str(randint(0,255))], ""],
 ["Test aléatoire 6", [str(randint(0,255))], ""]]
==


