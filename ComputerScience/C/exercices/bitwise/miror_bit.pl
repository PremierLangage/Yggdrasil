# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Miroir sur les bits d'un octect

author=Nicolas Borie
title=Miroir sur les bits d'un octet
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction C **bit_miror** qui prend en argument une
variable tenant sur un octet (faire un choix raisonnable) et retourne
une donnée de même type ayant pour valeur la même donnée binaire mais
dont les bits apparaissent dans l'ordre inverse que ceux de l'argument.

    1011 1001 --> 1001 1101
    0111 0101 --> 1010 1110
    1000 0001 --> 1000 0001
    1111 0000 --> 0000 1111
    0000 0000 --> 0000 0000
==

editor.code==
... bit_miror(...){
    /* Votre code ici */
}

==

solution==

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

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

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

tests==

[["Exécution simple", "1", ""],
 ["Bits nuls", "0", ""],
 ["Bits à 1", "255", ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""]]

==


