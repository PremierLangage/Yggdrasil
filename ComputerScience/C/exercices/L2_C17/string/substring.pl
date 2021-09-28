#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz <dr@univ-mlv.fr>
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Dominique Revuz

title=Sous-chaîne dans une chaîne
tag=function|string

taboo=strstr|strcasestr

text==#|markdown|
Écrire une fonction **substring** qui prend deux chaînes **big** et **sub** en argument. La fonction 
devra chercher si **sub** est contenu quelque part dans **big**. Elle devra retourner 1 si **sub** 
apparait dans **big** et 0 sinon.
==

editor.code==#|c|
int substring(... big, ... sub) {
  // Votre code ici...
}
==

solution==#|c|
#include <string.h>

int substring(char* big, char* sub) {
  return strstr(big, sub) != NULL; 
}
==

code_before==#|c|

==

code_after==#|c|

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


checks_args_stdin==#|python|
[ ["Test basique", ["unmotavecunlici", "l"], ""],
  ["Pas présent", ["unmotsanslalettre", "x"], ""], 
  ["Un anagrame", ["Borie", "Boire"], ""],
  ["A la fin", ['Borie aime bien Boire', 'Boire'], ""],
  ["Finalement", ["Qui aime Boire chatie bien", "Boire"], ""],
  ["Test aléatoire 1", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(2)]) ], "" ],
  ["Test aléatoire 2", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(2)]) ], "" ],
  ["Test aléatoire 3", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(2)]) ], "" ],
  ["Test aléatoire 4", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ],
  ["Test aléatoire 5", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ],
  ["Test aléatoire 6", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ] ]
==




