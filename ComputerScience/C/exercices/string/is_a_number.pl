# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
#

author=Nicolas Borie
title=Reconnaître un nombre
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction **is_a_number** qui prend en argument une chaîne 
de caractères C (en ascii) et retourne 1 si la chaine forme un nombre 
valide en base 10. La fonction retournera 0 sinon.

On considéra comme valide tout entier positif ou negatif. Voici des
entrées valides :
    
    0, 1, 324, -1, -0, -5243134, ...

Voici des entrées non valides :

    a12, 23d, -e1, 023, +23, 12a0, -0123, ...
   
==

editor.code==
int is_a_number(char* s){
  /* votre code ici... */
}
==

solution==

int is_a_number(char* s){
  int i=0;

  if (s[i] == '-')
    i++;
  if (s[i] == '0')
    return s[i+1] == '\0';
  while (s[i] != '\0'){
    if (s[i] < '0' || s[i] > '9')
      return 0;
    i++;
  }
  return 1;
}
==

codeafter==

#include <stdio.h>

int main(int argc, char* argv[]){
  if (is_a_number(argv[1])){
    printf("%s est un nombre valide.\n", argv[1]);
  }
  else{
    printf("%s n'est pas un nombre valide.\n", argv[1]);
  }
  return 0;
}
==

tests==
[ ["Basique", "0", ""] ]
==

