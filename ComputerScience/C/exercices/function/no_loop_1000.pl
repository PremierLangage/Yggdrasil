#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=1000 fois sans boucles ???
tag=string|chaine|longueur|caractère

text==
Écrire une fonction C qui écrit **1000 fois** une chaîne de caractères en argument 
sur la sortie standard. Rajoutez un retour à la ligne à chaque fois que vous
écrivez la chaîne de caractères. Ainsi, si la chaîne en argument est un seul mot,
votre fonction devra écrire 1000 lignes avec le mot seul à chaque fois, tout
cela sans boucle.

<br>

Toute construction du langage C est autorisée mais pas les boucles, les mots clés
**for** et **while** sont ainsi interdits.
==

taboo=for|while

editor.code==#|c|
void print_1000_times(char* s){
  /* Votre code ici... */
}
==

solution==#|c|
void print_1000_times(char* s){
  int i;
  for (i=0 ; i<1000 ; i++){
    printf("%s\n", s);
  }
}
==

code_before==#|c|

#include <stdio.h>

==

code_after==#|c|

int main(int argc, char* argv[]){
  print_1000_times(argv[1]);
  return 0;
}

==

checks_args_stdin==#|python|
[ ["Petit mot", ["mot"], ""],
  ["Test aléatoire 1", [choice(["Bonjour", "Pouet", "Exo pourri", "Trop simple", "Trop chiant", "copy-paste?"])], ""],
  ["Test aléatoire 2", [choice(["Bonjour", "Pouet", "Exo pourri", "Trop simple", "Trop chiant", "copy-paste?"])], ""],
  ["Test aléatoire 3", [choice(["Bonjour", "Pouet", "Exo pourri", "Trop simple", "Trop chiant", "copy-paste?"])], ""],
  ["Test aléatoire 4", [choice(["Bonjour", "Pouet", "Exo pourri", "Trop simple", "Trop chiant", "copy-paste?"])], ""],
  ["Test aléatoire 5", [choice(["Bonjour", "Pouet", "Exo pourri", "Trop simple", "Trop chiant", "copy-paste?"])], ""] ] 
==




