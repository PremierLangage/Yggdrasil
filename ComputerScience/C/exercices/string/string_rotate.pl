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
title=Rotation des lettres dans une chaîne
tag=function|type|string|decalage

# editor.height=300px

text==
Écrire une fonction C **rotate_string** qui prend en argument une chaîne de 
caractères et la modifie sur place en décalant toutes les lettres d'un cran vers 
la gauche. La nouvelle première lettre sera donc l'ancienne seconde lettre, la 
nouvelle seconde lettre sera l'ancienne troisième, etc... L'ancienne prenière 
lettre devra se retrouver à la fin du mot une fois modifié. Veuillez bien à 
ce que la chaîne reste une chaîne de caractère C valide.
==

checks_args_stdin==#|python|
 [["Exemple simple", ["ecart"], ""], 
 ["Mot fixe par rotation", ["XXXXX"], ""],
 ["Mot vide", [""], ""],
 ["Plusieurs mots dans une chaîne", ["plusieurs mot dans une seule chaine"], ""],
 ["Test aléatoire 1", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""],
 ["Test aléatoire 2", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""],
 ["Test aléatoire 3", ["".join([chr(randint(97, 122)) for i in range(randint(10,20))])], ""]]
==

editor.code==#|c|
void rotate_string(char* s){
  /* Votre code ici... */
}
==

solution==#|c|
void rotate_string(char* s){
  int i;
  int first;

  if (strlen(s) <= 1)
    return ;
  first = s[0];
  for (i=0 ; s[i+1] != '\0' ; i++){
    s[i] = s[i+1];
  }
  s[i] = first;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  char s[256];

  strcpy(s, argv[1]);
  printf("%s\n", s);
  rotate_string(s);
  printf("%s\n", s);
  return 0;
}
==


