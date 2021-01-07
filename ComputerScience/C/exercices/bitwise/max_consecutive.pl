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

title=Taille du plus grand paquet de bits consécutifs égaux
tag=bitwise|fonction|comptage|consécutifs|zone|pointeur|void*

text==#|markdown|
Écrire une fonction C **max_consecutive** qui prend en argument l'adresse 
d'une zone mémoire **seq** ainsi que sa taille en octets **nb_oct** et
retourne le nombre maximum de bits consécutifs de même valeur dans la
zone mémoire (qui est donc à lire bit par bit). Pour votre
information, il est possible de le faire en une seule lecture.

==

editor.code==#|c|
int max_consecutive(void* seq, size_t nb_oct){
  /* ... votre code ici ... */
}
==

solution==#|c|
int max_consecutive(void* seq, size_t nb_oct){
  int i, j;
  unsigned char* s = (unsigned char*)seq;
  int bit;
  int bit_prec = -1;
  int current_pack = 0;
  int max_pack = 0;

  for (i=0 ; i<nb_oct ; i++){
    for(j=7 ; j>=0 ; j--){
      bit = ((*(s+i) & (1 << j)) != 0);
      if (bit == bit_prec){
        current_pack += 1;
      }
      else{
        if (current_pack > max_pack)
          max_pack = current_pack;
        current_pack = 1;
        bit_prec = bit;
      }
    }
  }
  if (current_pack > max_pack)
    max_pack = current_pack;

  return max_pack;
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
  printf("max consecutive : %d\n", max_consecutive((void*)s, argc-1));
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Pas de bit", ["0", "0", "0", "0"], ""],
 ["64 bits", ["255", "255", "255", "255", "255", "255", "255", "255"], ""],
 ["Alternance", ["255", "0", "255", "0", "255", "0", "255", "0"], ""],
 ["Test aléatoire 1", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 2", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 3", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 4", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 5", [str(randint(0,255)) for i in range(randint(2, 20))], ""] ]
==


