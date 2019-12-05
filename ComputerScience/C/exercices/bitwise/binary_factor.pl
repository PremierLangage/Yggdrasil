# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Sous facteur binaire dans un mot binaire

author=Nicolas Borie
title=Sous facteur binaire dans un entier long
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction qui détecte la présence du mot binaire **1101** dans 
la donnée binaire d'un entier long non signé. Votre fonction devra retourner 
l'entier **1** si la séquence contiguë **1101** apparaît dans la donnée 
binaire de l'entier long non signé en argument et elle devra retourner 
**0** sinon.

==

editor.code==
... has_factor_1101(...){
    /* Votre code ici */
}

==

solution==

int has_factor_1101(unsigned long int u){
  int i;

  for(i=0 ; i<8*sizeof(unsigned long int) - 3 ; i++){
    if (((u >> i) & 15) == 13)
      return 1;
  }
  return 0;
}

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

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
  if (has_factor_1101( *((unsigned long int*)s) ))
    printf("TRUE\n");
  else
    printf("FALSE\n");

  return 0;
}

==

tests==

[["Exécution simple", "13 13 13 13", ""],
 ["Pas de bit", "0 0 0 0", ""],
 ["64 bits", "255 255 255 255", ""],
 ["Alternances", "85 85 85 85", ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(4)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(4)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,12)) for i in range(4)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(4)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(4)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(4)]), ""],]

==



