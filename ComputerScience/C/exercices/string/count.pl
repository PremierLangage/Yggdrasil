#*****************************************************************************
#  Copyright (C) 2017 Dominique R <dr@univ-mlv.fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Occurences de caractères
tag=string|function|pointer


text==
Complèter la fonction **count** pour quelle retourne le nombre 
d'occurences du charactère **c** passé en argument dans la chaîne **s** 
elle aussi donnée en argument.

<br />

Écrire votre fonction sans rien utiliser des bibliothèques standards.

<br />

  __Rappel :__ une chaîne de caractères C est tout d'abord un tableau de
  **char**. Une chaîne est donc manipulée par l'adresse de son premier
  élément. Une chaîne de caractères C se termine toujours par le
  caractère **'\0'** qui encode justement la fin de la chaîne. C'est un
  marqueur de fin de tableau car le langage C ne connait pas la longueur
  des tableaux.

<br />
==

taboo=string.h


editor.code==
int count(char* s, char c){
  /* Votre code ici... */
}

==

solution==

int count(char* s, char c){

  int nb=0;
  for(;*s;s++) if (*s==c) nb++;
  return nb;
}

==

code_before==

#include <stdio.h>
#include <stdlib.h>

==

code_after==

int main(int argc, char* argv[]){

 printf("Y'a %d '%c' dans %s",count(argv[1],argv[2][0]),argv[2][0],argv[1]);

  return 0;
}

==

checks_args_stdin==#|python|
[ ["premier test", "bonjour o", ""],
  ["pas d'occurences", "anticonstitutionnellement b", ""], 
  ["que la lettre", "ooooooooo o", ""], 
  ["une occurence", "xxxlhkjhkdqkshdksqjdhlkXqkjhdshlddhqslk X", ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""] ] 
==



