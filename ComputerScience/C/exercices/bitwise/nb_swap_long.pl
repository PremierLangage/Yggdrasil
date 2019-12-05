# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Compter les bits à un 

author=Nicolas Borie
title=Popcount : compter les bit à 1
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction C **popcount** qui prend en argument l'adresse d'une zone
mémoire ainsi que sa taille en octet. La fonction devra retourner le nombre de 
bits valant 1 dans la zone mémoire en argument. Veuillez à ce que votre fonction 
reste générique et portable. Compte tenu de ces faibles informations, faites 
des choix cohérents.
==

editor.code==
... popcount(... addr, ... size){
    /* Votre code ici */
}

==

solution==

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

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){
  unsigned char s[100];
  int i;

  for(i=1 ; i<argc ; i++){
    *(s+i-1) = atoi(argv[i]);
  }
  printf("popcount : %lu\n", popcount((void*)s, argc-1));
  return 0;
}

==

tests==

[["Exécution simple", "0 0 0 0 0 0 0 1", ""],
 ["Que des zéros", "0 0 0 0 0 0 0 0", ""],
 ["Que des uns", "255 255 255 255 255 255 255 255", ""],
 ["Alternance maximale", "85 85 85 85 85 85 85 85", ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(8)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(8)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(8)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(8)]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(8)]), ""]]

==

