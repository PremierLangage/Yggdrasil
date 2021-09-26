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

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Nicolas Borie

title=longueur d'une chaîne de caractères
tag=string|chaine|longueur|caractère

text==#|markdown|
Complètez la fonction suivante pour quelle retourne le nombre de
caractères contenus dans la chaîne **s** donnée en argument. Vous
devez écrire votre fonction sans rien utiliser des bibliothèques
standards.

<br />

Pour rappel, une chaîne de caractères C est tout d'abord un tableau de
**char**. Une chaîne est donc manipulée par l'adresse de son premier
élément. Une chaîne de caractères C se termine toujours par le
caractère **'\0'** qui encode justement la fin de la chaîne. C'est un
marqueur de fin de tableau car le langage C ne connait pas la longueur
des tableaux.

<br />

Pour obtenir la longueur de la chaîne **s**, il faut ainsi compter le
nombre de lettres apparaissant dans **s** avant le caractère de fin de
chaîne.

==

taboo=strlen

editor.code==#|c|
int string_length(char* s){
  // Votre code ici...
}

==

solution==#|c|
int string_length(char* s){
  int len;
  
  for(len=0 ; s[len] != '\0'; len++) {}
  return len;
}
==

code_before==#|c|

#include <stdio.h>

int string_length(char* s);

int main(int argc, char* argv[]){
  
  printf("La chaîne \"%s\" a pour longueur %d\n", argv[1], string_length(argv[1]));
  return 0;
}

==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Petit mot", ["mot"], ""], 
  ["Un mot", ["Bonjour"], ""], 
  ["Deux mots", ["ca va?"], ""], 
  ["Mot vide", [""], ""], 
  ["Long mot", ["Anti-constitutionnellement"], ""],
  ["Test aléatoire 1", [choice(["radar", "bouteille", "la", "chat", "romantique", "ete", "liquide"])], ""],
  ["Test aléatoire 2", [choice(["radar", "bouteille", "la", "chat", "romantique", "ete", "liquide"])], ""] ] 
==


astuces==#|python|
[
  { "content": """Une simple boucle `for` suffit pour écrire une telle fonction."""},
  { "content": """Le critère d'arrêt porte sur la détection du caractère de fin de chaîne : `\0`."""},
  { "content": """une boucle comme la suivante est raisonnable : `for(i=0 ; s[i] != '\0'; i++)`."""}
]
==

