# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
# Copyright 2017 DR
#

author=NB & DR
title=Sous chaîne dans une chaîne
tag=function|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction **substring** qui prend deux chaînes **big** et **sub** en argument. La fonction 
devra chercher si **sub** est contenu quelque part dans **big**. Elle devra retourner 1 si **sub** 
apparait dans **big** et 0 sinon.
==

editor.code==
int in(... c, ... s) {
  /* Votre code ici ... */
}
==

solution==

#include <string.h>
int in(char c, char *p){
  for(;*p;p++)  if (*p==c) return 1;
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
[ ["Basique", "l unmotavecunl", ""],
  ["Pas present", "X bcdfghjklmnpqrstvwxz", ""],
   ]

for i in range(3):
    taille = random.randint(10, 30)
    mot = ""
    for j in range(taille):
        if random.randint(0,1) == 0:
            mot += chr(97+random.randint(0,25))
        else:
            mot += chr(68+random.randint(0,25))
    tests.append(["Aléatoire présent", mot[3]+" "+mot, ""])
    tests.append(["Aléatoire absent", "A "+mot, ""])
==


