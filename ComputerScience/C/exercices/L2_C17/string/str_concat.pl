#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Reconnaître un nombre entier

tag=string|chaine|conversion|verification

text==#|markdown|
Écrire une fonction **is_a_number** qui prend en argument une chaîne 
de caractères C (en ascii) et retourne 1 si la chaine forme un nombre 
valide en base 10. La fonction retournera 0 sinon.

On considéra comme valide tout entier positif ou negatif, sans zéro 
superflu en tête. Voici des entrées valides :
    
    0, 1, 324, -1, -0, -5243134, ...

Voici des entrées non valides :

    a12, 23d, -e1, 023, +23, 12a0, -0123, ...

==

editor.code==#|c|
int is_a_number(char* s){
  // votre code ici...
}
==

solution==#|c|
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

code_before==#|c|

==

code_after==#|c|
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

checks_args_stdin==#|python|
[ ["Test basique", ["0"], ""],
  ["Plus d'une centaine", ["123"], ""],
  ["Avec des lettres", ["12a0"], ""],
  ["Petit négatif", ["-47"], ""],
  ["Très grand nombre", ["12172364512235126361273223736"], ""],
  ["Fort négatif", ["-999999999999999"], ""],
  ["Test aléatoire 1", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 2", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 3", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 4", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 5", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""] ]
==

astuces==#|python|
[
  { "content": """Il faut écrire un mini parseur qui vérifie que la chaine est un nombre entier base 10 valide. Pour cela, le mieux est de procéder char par char avec une tête de lecture qui commence au début du mot."""},
  { "content": """Le premier caractère peut être `-` ou bien un chiffre. Une lettre `c` est un chiffre tel que `(c >= '0')` et `(c <= '9')`."""},
  { "content": """Attention, si le premier caractère est un zéro, alors il doit être suivi de `\\0`."""}
]
==


