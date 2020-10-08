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

title=Données entrées au clavier pour décrire une personne
tag=input_output

text==
Compléter le programme suivant pour qu'il récupère deux chaines de
caractères ainsi qu'un entier donné au clavier durant l'exécution du
programme. Une fois les données récupérées, le programme affichera les
données avec la phrase : 

<br />

Bonjour `<prénom>` `<nom>`, vous avez `<age>`ans. 

<br />

`<prénom>`, `<nom>` et `<age>` devront être correctement substitué.

==

editor.height=350px

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){
  char prenom[64];
  char nom[64];
  int age;
	
  printf("Donner votre prénom :\n");
  ...
  printf("Donner votre nom :\n");
  ...
  printf("Donner votre age :\n");
  ...
  printf("Bonjour Martin Tartenpion, vous avez 99 ans\n");
  ...
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  char prenom[64];
  char nom[64];
  int age;
	
  printf("Donner votre prénom :\n");
  scanf("%s", prenom);
  printf("Donner votre nom :\n");
  scanf("%s", nom);
  printf("Donner votre age :\n");
  scanf("%d", &age);
  printf("Bonjour %s %s, vous avez %d ans\n", prenom, nom, age);
  return 0;
}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Basique", [], "Martin\nTartenpion\n99\n"],
 ["Vieux machin", [], "Maitre\nYoda\n982\n"],
 ["Age mental", [], "Nicolas\nBorie\n12\n"],
 ["Jeune pousse", [], "Tom\nPouce\n28\n"]]
==



