# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Taille du dernier paquet de bit à 1

author=Nicolas Borie
title=Taille du paquet de bits de poids faible
tag=bitwise|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction **size_last_pack** qui prend en argument un
caractère C non signé et retourne le nombre de bit à 1 consécutifs
dans le dernier paquet de 1. De manière équivalente, la fonction
retourne la taille du paquet de 1 de poids le plus faible (le paquet
le plus à droite dans une écriture binaire raisonnable). L'exemple sur
des entrées aléatoires devrait vous aider à comprendre cette
fonctionnalité.

    10111011 = 187 : 2
    00011101 =  29 : 1
    00111010 =  58 : 1
    00110110 =  54 : 2
    00010111 =  23 : 3
    11101000 = 232 : 1
    11001111 = 207 : 4
    11110001 = 241 : 1
    11111110 = 254 : 7
    11110010 = 242 : 1
    00000000 =   0 : 0
    11110001 = 241 : 1
    11011110 = 222 : 4

==

editor.code==
... size_last_pack(...){
  /* ... votre code ici ... */
}

==

solution==

int size_last_pack(unsigned char c){
  int old_pack = 0;
  int current_pack = 0;
  int i;
  int bit;
  
  for (i=7 ; i>=0 ; i--){
    bit = (c & (1 << i));
    if (bit)
      current_pack++;
    else{
      if (current_pack != 0){
	old_pack = current_pack;
	current_pack = 0;
      }
    }	
  }
  if (current_pack != 0)
    return current_pack;
  else
    return old_pack;
}

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

void print_bin(char n){
  int i;
  
  for (i=7 ; i>=0 ; i--)
    printf("%d", ((n & (1 << i)) != 0));
}

int main(int argc, char* argv[]){
  unsigned int i;
  unsigned char c;

  for (i=0 ; i<20 ; i++){
    c = atoi(argv[1]);
    print_bin(c);
    printf(" = %3u : %d\n", (unsigned char)c, size_last_pack(c));
  }
  return 0;
}

==

tests==

[["Exécution simple", "1", ""],
 ["Bits nuls", "0", ""],
 ["Bits à 1", "255", ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""],
 ["Aléatoire", str(random.randint(0,255)), ""]]

==



