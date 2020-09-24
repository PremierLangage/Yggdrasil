#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
title=Renverser les mots d'une phrase
tag=function|string|mots|difficile

text==
Écrire une fonction C **reverse_words** qui affiche le contenu de la phrase 
(une chaîne de caractères C) en argument mais les mots sont affichés dans 
l’ordre inverse. Placée dans un programme, voilà l’effet voulu :

    Platon@debian~$> ./a.out "La force tu dois ressentir!"
    ressentir! dois tu force La
    Platon@debian~$> ./a.out "Plus il y a de fous, plus on rit!"
    rit! on plus fous, de a y il Plus

Les mots sont délimités par un unique espace. On ne touche pas aux majuscules 
et minuscules. La ponctuation, quand elle existe, est portée par le mot 
auquel elle est accolée.
==

editor.code==#|c|
#include ...

void reverse_words(char* sentence){
  /* Votre code ici... */
}
==

solution==#|c|
#include <stdio.h>
#include <string.h>

void reverse_words(char* s){
  int i, j;

  for(i=strlen(s)-1 ; i>=0 ; i--){
    if (s[i] == ' '){
      for(j=i+1 ; s[j]!=' ' && s[j]!='\0' ; j++)
        putchar(s[j]);
      putchar(' ');
    }
  }
  for(j=i+1 ; s[j]!=' ' && s[j]!='\0' ; j++)
    putchar(s[j]);
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]){
  char s[8000];

  strcpy(s, argv[1]);
  reverse_words(s);
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["deux mot"], ""],
 ["Exemple énoncé 1", ["La force tu dois ressentir!"], ""],
 ["Exemple énoncé 2", ["Plus il y a de fous, plus on rit!"], ""],
 ["Test aléatoire 1", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 6))])], ""],
 ["Test aléatoire 2", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 7))])], ""],
 ["Test aléatoire 3", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 8))])], ""],
 ["Test aléatoire 4", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 9))])], ""],
 ["Test aléatoire 5", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 10))])], ""],
 ["Test aléatoire 6", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 11))])], ""],
 ["Test aléatoire 7", [" ".join([''.join([chr(randint(97,122)) for j in range(randint(1,20))]) for i in range(randint(1, 12))])], ""]]
==



