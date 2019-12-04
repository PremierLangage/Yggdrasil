# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# nombre maximal de bits consécutif

author=Nicolas Borie
title=Taille du plus grand paquet de bits consécutifs égaux
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction C **max_consecutive** qui prend en argument l'adresse 
d'une zone mémoire **seq** ainsi que sa taille en octets **nb_oct** et
retourne le nombre maximum de bits consécutifs de même valeur dans la
zone mémoire (qui est donc à lire bit par bit). Pour votre
information, il est possible de le faire en une seule lecture.

==

editor.code==
int max_consecutive(void* seq, size_t nb_oct){
  /* ... votre code ici ... */
}

==

solution==

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
  printf("max consecutive : %d\n", max_consecutive((void*)s, argc-1));
  return 0;
}


==

tests==

[["Exécution simple", "1", ""],
 ["Pas de bit", "0 0 0 0", ""],
 ["64 bits", "255 255 255 255 255 255 255 255", ""],
 ["Alternance", "255 0 255 0 255 0 255 0", ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""],
 ["Aléatoire", " ".join([str(random.randint(0,255)) for i in range(random.randint(2, 20))]), ""]]

==


