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
tag=fonction|string|tableau

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

autre_solution==#|c|
#include <string.h>

int substring(char* big, char* sub) {
  int i, j;
  i=0;
  for (i=0 ; big[i]!='\0' ; i++){
    for (j=0 ; sub[j]!='\0' && big[i+j]!='\0' ; j++)
      if (big[i+j]!=sub[j])
        break;
    if (sub[j]=='\0')
      return 1;
  } 
  return 0;
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
  ["Test aléatoire 6", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ],
  ["Test aléatoire 7", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ],
  ["Test aléatoire 8", ["".join([chr(randint(97,102)) for i in range(50)]), "".join([chr(randint(97,102)) for i in range(3)]) ], "" ] ]
==

astuces==#|python|
[
  { "content": """Il n'est pas nécessaire de programmer un algorithme optimisé pour cet exercice. On se contentera d'un algorithme quadratrique ayant deux boucles `for` imbriquées."""},
  { "content": """L'idée de l'algorithme est la suivante : pour chaque lettre du grand mot, on essaie de voir si cette lettre n'est pas le début d'une occurence du petit mot dans le grand. La grosse difficulté de cet exercice est alors de ne pas lire au delà des caratères de fin de chaîne '\\0' dans les deux mots."""},
  { "content": """Avec les indices `i` et `j`, les deux boucles peuvent facilement être les suivantes : `for (i=0 ; big[i]!='\\0' ; i++)` et `for (j=0 ; sub[j]!='\\0' && big[i+j]!='\\0' ; j++)`. La fonction ne contient pas que ça naturellement..."""}
]
==

