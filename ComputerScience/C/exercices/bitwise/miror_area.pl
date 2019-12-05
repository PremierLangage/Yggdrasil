# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Faire un miroir binaire sur une zone mémoire

author=Nicolas Borie
title=Miroir binaire sur zone mémoire
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction **miror_bin** qui prend en argument une zone mémoire 
**data** de taille **size** octets et qui modifie cette zone pour la 
transformer en son miroir binaire. Après exécution, **data** pointe vers 
la même zone mémoire mais les bits apparaissent par une lecture de droite 
à gauche au lieu de gauche à droite.

Par exemple si data pointe vers un tableau de 4 **unsigned char**
et que la représentation binaire de data est:


    10011010 | 01011011 | 11101010 | 11011111

Alors, après l'appel **miror_bin(data, 3)** (on rappelle que $3 \neq 4$), 
**data** pointera vers la donnée binaire:


    01010111 | 11011010 | 01011001 | 11011111

Le bit de poids fort du premier octet est le plus à gauche, le bit de
poids faible du dernier octet est le plus à droite.

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

[["Exécution simple", "1", ""],
 ["Pas de bit", "0 0 0 0", ""],
 ["64 bits", "255 255 255 255 255 255 255 255", ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""]]

==



