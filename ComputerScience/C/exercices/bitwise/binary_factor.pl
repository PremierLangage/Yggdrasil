#*****************************************************************************
#  Copyright (C) 2018 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Sous facteur binaire dans un entier long
tag=bitwise|function|facteur|mot

text==#|markdown|
Écrire une fonction qui détecte la présence du mot binaire **1011** dans 
la donnée binaire d'un entier long non signé. Votre fonction devra retourner 
l'entier **1** si la séquence contiguë binaire **1011** apparaît dans la 
donnée binaire de l'entier long non signé en argument et elle devra retourner 
**0** sinon.
==

editor.code==#|c|
... has_factor_1011(...){
  /* Votre code ici */
}
==

solution==#|c|
int has_factor_1011(unsigned long int u){
  int i;

  for(i=0 ; i<8*sizeof(unsigned long int) - 3 ; i++){
    if (((u >> i) & (unsigned long int)15) == (unsigned long int)11)
      return 1;
  }
  return 0;
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
  if (has_factor_1011( *((unsigned long int*)s) ))
    printf("TRUE\n");
  else
    printf("FALSE\n");

  return 0;
}

==

checks_args_stdin==#|python|
[["Exécution simple", ["11", "11", "11", "11", "11", "11", "11", "11"], ""],
 ["Pas de bit", ["0", "0", "0", "0", "0", "0", "0", "0"], ""],
 ["64 bits", ["255", "255", "255", "255", "255", "255", "255", "255"], ""],
 ["Alternances de bit", ["85", "85", "85", "85", "85", "85", "85", "85"], ""],
 ["Test aléatoire 1", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 2", [str(randint(0,255)) for i in range(8)], ""],
 ["Test aléatoire 3", [str(randint(1,10)) for i in range(8)], ""],
 ["Test aléatoire 4", [str(randint(1,27)) for i in range(8)], ""],
 ["Test aléatoire 5", [str(randint(1,27)) for i in range(8)], ""],
 ["Test aléatoire 6", [str(randint(1,27)) for i in range(8)], ""],
 ["Test aléatoire 7", [str(randint(1,27)) for i in range(8)], ""],
 ["Test aléatoire 8", [str(randint(0,255)) for i in range(8)], ""]]
==



