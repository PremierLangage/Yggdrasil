# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
# Copyright 2017 DR
#

author=NB & DR
title=Sous-chaîne dans une chaîne
tag=function|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction **substring** qui prend deux chaînes **big** et **sub** en argument. La fonction 
devra chercher si **sub** est contenu quelque part dans **big**. Elle devra retourner 1 si **sub** 
apparait dans **big** et 0 sinon.
==

editor.code==
int substring(... big, ... sub) {
  /* Votre code ici ... */
}
==

solution==

#include <string.h>

int substring(char* big, char* sub) {
  int i, j;
  
  for(i=0 ; big[i]!='\0' ; i++){
    for(j=0 ; sub[j]!='\0' ; j++)
      if(big[i] != sub[j])
        break;
    if(sub[j]=='\0')
      return 1;
  }
  return 0;
}

==

codeafter==

#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){

  if (in(argv[1][0],argv[2]))
    printf("la chaine  %s contient la lettre %c\n",argv[2],argv[1][0]);
  else
    printf("la chaine  %s contient pas la lettre %c\n",argv[2],argv[1][0]);
  return 0;
}
==


tests==
[ ["Basique", "l unmotavecunlici", ""],
  ["Pas présent", "x unmotsanslalettre", ""] ]
==


