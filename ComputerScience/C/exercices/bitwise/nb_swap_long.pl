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

title=Alternances de bits dans un entier long
tag=bitwise|fonction|bit|octet|changements|comptage

text==#|markdown|
Écrire une fonction **nb_swap_bit** qui retourne le nombre d'alternances 
de bit dans un entier long positif. Une alternance est un motif **01** 
ou **10** dans la donnée binaire. Autrement dit, c'est aussi le nombre de
fois qu'un bit n'est pas égal à son prédécesseur. 

Voici des exemples pour des caractères positifs :

    255 : 1111 1111 --> 0
      0 : 0000 0000 --> 0
     85 : 0101 0101 --> 7
     51 : 0011 0011 --> 3
    214 : 1101 0110 --> 5

Attention, ici votre fonction doit effectuer ce comptage d'alternance sur 
des entiers longs positifs.

==

editor.code==#|c|
int nb_swap_bit(...){
    /* Votre code ici */
}
==

solution==#|c|
int nb_swap_bit(unsigned long int u){
  int i;
  unsigned long int bit, bit_prec, ans=0, un = 1;
  bit_prec = u & un;

  for(i=1 ; i<8*sizeof(unsigned long int) ; i++){
    bit = (u >> i) & un;
    if (bit != bit_prec){
      ans++;
      bit_prec = bit;
    } 
  }
  return ans;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  unsigned char s[100];
  int i;

  for(i=1 ; i<argc ; i++){
    *(s+i-1) = atoi(argv[i]);
  }
  printf("nb_swap_bit : %d\n", nb_swap_bit( *((unsigned long int*)s) ) ) ;
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["0", "0", "0", "0", "0", "0", "0", "255"], ""],
 ["Que des zéros", ["0", "0", "0", "0", "0", "0", "0", "0"], ""],
 ["Que des uns", ["255", "255", "255", "255", "255", "255", "255", "255"], ""],
 ["Alternance maximale", ["85", "85", "85", "85", "85", "85", "85", "85"], ""],
 ["Test aléatoire 1", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 2", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 3", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 4", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 5", [str(randint(0,255)) for i in range(8)], ""]]
==

