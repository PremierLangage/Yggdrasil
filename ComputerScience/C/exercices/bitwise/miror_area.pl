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
void miror_bin(void* data, size_t size){
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

void miror_bin(void* data, size_t size){
  int i;
  unsigned char tmp;
  unsigned char* s = (unsigned char*)data;

  for(i=0 ; i<size/2 ; i++){
    tmp = s[i];
    s[i] = bit_miror(s[size-1-i]);
    s[size-1-i] = bit_miror(tmp);
  }
  if (size%2)
    s[size/2 + 1] = = bit_miror(s[size/2 + 1]);
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
}


int main(int argc, char* argv[]){
  unsigned char s[100];
  int i;

  for(i=1 ; i<argc ; i++){
    *(s+i-1) = atoi(argv[i]);
  }


  miror_bin((void*)s, argc-1);
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



