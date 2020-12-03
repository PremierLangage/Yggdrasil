#*****************************************************************************
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

title=Parité binaire dans un entier
tag=bitwise|fonction|parité|bitabit

text==
Écrire une fonction C prenant en argument un entier **n** qui retourne **1**
si l'entier **n** contient un nombre pair de bits à **1** dans son écriture 
binaire. Votre fonction devra retourner **0** sinon, c'est à dire quand 
**n** contient un nombre impair de bits à **1**.
==

editor.code==#|c|
int bin_parity(int n){
  /* Votre code ici... */
}
==

solution==#|c|
int bin_parity(int n){
  if (n == 0)
    return 1;
  if ((n%2))
    return 1 - bin_parity(((unsigned int)n) >> 1);
  return bin_parity(((unsigned int)n) >> 1);
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|

void print_bin(unsigned char u){
  int i;

  for(i=7 ; i>=0 ; i--)
    printf("%c", (u & (1<<i))?'1':'0');
}

void print_area(void* data, size_t size){
  int i;
  unsigned char* s = (unsigned char*)data;

  for(i=0 ; i<size ; i++){
    print_bin(s[i]);
  }
  putchar('\n');
}


int main(int argc, char* argv[]){
  unsigned char s[100];
  int i;

  for(i=1 ; i<argc ; i++){
    *(s+i-1) = atoi(argv[i]);
  }

  
  print_area((void*)s, argc-1);
  if (bin_parity( *((int*)s) ))
    printf("Nombre pair de bits à 1\n");
  else
    printf("Nombre impair de bits à 1\n");

  return 0;
}

==

checks_args_stdin==#|python|
[["Exécution simple 3 bits", ["1", "1", "1", "0"], ""],
 ["Pas de bit", ["0", "0", "0", "0"], ""],
 ["32 bits", ["255", "255", "255", "255"], ""],
 ["31 bits", ["255", "255", "255", "254"], ""],
 ["Alternances de bit", ["85", "85", "85", "85"], ""],
 ["Test aléatoire 1", [str(randint(0,255)) for i in range(4)], ""],
 ["Test aléatoire 2", [str(randint(0,255)) for i in range(4)], ""],
 ["Test aléatoire 3", [str(randint(0,12)) for i in range(4)], ""],
 ["Test aléatoire 4", [str(randint(0,255)) for i in range(4)], ""],
 ["Test aléatoire 5", [str(randint(0,255)) for i in range(4)], ""]]
==


