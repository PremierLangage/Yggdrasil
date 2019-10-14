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
  return strstr(big, sub);
}

==

codeafter==

#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){

  if (substring(argv[1], argv[2]))
    printf("'%s' contient le mot '%s'",argv[1], argv[2]);
  else
    printf("'%s' ne contient pas le mot '%s'",argv[1], argv[2]);

  return 0;
}
==


tests==
[ ["Basique", "unmotavecunlici l", ""],
  ["Pas présent", "unmotsanslalettre x", ""], 
  ["Anagrame", "Borie Boire", ""],
  ["A la fin", "'Borie aime bien Boire' Boire", ""],
  ["Finalement", "'Qui aime Boire chatie bien' Boire", ""],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(2)]), "" ],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(2)]), "" ],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(2)]), "" ],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(random.randint(97,122)) for i in range(50)]) + " " + "".join([chr(random.randint(97,122)) for i in range(3)]), "" ] ]
==


