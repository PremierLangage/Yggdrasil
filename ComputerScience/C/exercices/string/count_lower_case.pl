#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Compter les lettres minuscules
tag=string|chaine|caractère|comptage|minuscule|ascii


text==
Écrire une fonction qui prend en argument une chaîne de caractères C
en ascii et retourne le nombre de lettres minuscules contenues dans 
cette chaîne. 
==

editor.code==#|c|
int count_lower_case(char* s){
  /* votre code ici... */
}
==

solution==#|c|
int count_lower_case(char* s){
  int i;
  int lower=0;

  for (i=0 ; s[i]!='\0' ; i++){
    if ((s[i] >= 'a') && (s[i] <= 'z')){
      lower++;
    }
  }
  return lower;
}
==

codeafter==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  printf("%d\n", count_lower_case(argv[1]));

  return 0;
}
==

checks_args_stdin==#|python|
[ ["Mot simple", ["salut"], ""],
  ["Mot compliqué", ["Bonjour12LARTISTE42a"], ""],
  ["Mot vide", [""], ""],
  ["Mot aléatoire 1", ["".join([chr(65+randint(0,25)+(randint(0,1)*(97-65))) for i in range(randint(10, 30))])], ""],
  ["Mot aléatoire 2", ["".join([chr(65+randint(0,25)+(randint(0,1)*(97-65))) for i in range(randint(10, 30))])], ""],
  ["Mot aléatoire 3", ["".join([chr(65+randint(0,25)+(randint(0,1)*(97-65))) for i in range(randint(10, 30))])], ""] ]
==




