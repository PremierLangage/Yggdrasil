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

editor.height=350px

title=Reconstruire un entier depuis son écriture base 10

tag=string|fonction|chaine|arithmetique|conversion

taboo=string|atoi|strtol

text==#|markdown|
Écrire une fonction **str_to_int_secure**
==

editor.code==#|c|
int str_to_int_secure(char* s, int* val){
  // Votre code ici...
}
==

solution==#|c|
int str_to_int_secure(char* s, int* val){
  int i=0;
  int cumul=0;
  int sign=1;

  if (s[i] == '-'){
    i++;
    sign=-1;
  }
  if (s[i] == '0'){
    if (s[i+1] == '\0'){
      *val = 0;
      return 1;
    }
    else{
      return 0;
    }
  }
  while (s[i] != '\0'){
    if (s[i] < '0' || s[i] > '9')
      return 0;
    cumul = cumul*10 + (s[i] - '0');
    i++;
  }
  *val = sign*cumul;
  return 1;
}
==

code_before==#|c|
#include <stdio.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int val;

  if (str_to_int_secure(argv[1], &val))
    printf("La chaîne décrit l'entier %d.\n", val);
  else
    printf("La chaîne ne décrit pas un nombre.\n");
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["0"], ""],
  ["Plus d'une centaine", ["123"], ""],
  ["Avec des lettres", ["12a0"], ""],
  ["Petit négatif", ["-47"], ""],
  ["Très grand nombre", ["1217236451"], ""],
  ["Fort négatif", ["-999999999"], ""],
  ["Test aléatoire 1", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 2", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 3", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 4", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 5", [choice(["781","-1274","997421","-75.43","3.1415","12521z","-124b","82c12","-124b","-142c1","-12.21"])], ""],
  ["Test aléatoire 6", [str(randint(-100000000, 100000000))], ""] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

