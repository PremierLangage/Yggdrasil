# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
# Copyright 2017 DR <dr@univ-mlv.fr>
#

author=Nicolas Borie
title=Occurences de caractères
tag=string|function|pointer
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Complètez la fonction suivante **count** pour quelle retourne le nombre 
d'occurences du charactère **c** passé en argument dans la chaîne **s** 
donnée en argument.


Vous devez écrire votre fonction sans rien utiliser des 
bibliothèques standards.

  __Rappel :__ une chaîne de caractères C est tout d'abord un tableau de
  **char**. Une chaîne est donc manipulée par l'adresse de son premier
  élément. Une chaîne de caractères C se termine toujours par le
  caractère **'\0'** qui encode justement la fin de la chaîne. C'est un
  marqueur de fin de tableau car le langage C ne connait pas la longueur
  des tableaux.

taboo: string.h
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

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){

 printf("Y'a %d '%c' dans %s",count(argv[1],argv[2][0]),argv[2][0],argv[1]);

  return 0;
}

==

tests==
[ ["premier test", "bonjour o", ""],
  ["pas d'occurences", "anticonstitutionnellement b", ""], 
  ["que la lettre", "ooooooooo o", ""], 
  ["une occurence", "xxxlhkjhkdqkshdksqjdhlkXqkjhdshlddhqslk X", ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""],
  ["aléatoire", "".join([chr(random.randint(97, 122)) for i in range(50)]) + " " + chr(random.randint(97, 122)), ""] ] 
==


