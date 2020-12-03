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

title=Popcount : compter les bit à 1
tag=bitwise|fonction|comptage|transtypage|binaire


text==
Écrire une fonction C **popcount** qui prend en argument l'adresse d'une zone
mémoire ainsi que sa taille en octet. La fonction devra retourner le nombre de 
bits valant 1 dans la zone mémoire en argument. Veuillez à ce que votre fonction 
reste générique et portable. Compte tenu de ces faibles informations, faites 
des choix cohérents.
==

editor.code==#|c|
... popcount(... addr, ... size){
    /* Votre code ici */
}

==

solution==#|c|
size_t popcount(void* addr, size_t size){
  int i, j;
  char* s = (char*)addr;
  size_t ans = 0;

  for(i=0 ; i<size ; i++){
    for(j=0 ; j<8 ; j++){
      if (*(s+i) & (1<<j))
        ans++;
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
  printf("popcount : %lu\n", popcount((void*)s, argc-1));
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Aucun bit positif", ["0", "0", "0", "0"], ""],
 ["64 bits positifs", ["255", "255", "255", "255", "255", "255", "255","255"], ""],
 ["Test aléatoire 1", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 2", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 3", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 4", [str(randint(0,255)) for i in range(randint(2, 20))], ""],
 ["Test aléatoire 5", [str(randint(0,255)) for i in range(randint(2, 20))], ""]]

==


