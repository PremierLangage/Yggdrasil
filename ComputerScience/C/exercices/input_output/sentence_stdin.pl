#*****************************************************************************
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

title=Récupérer puis écrire une ligne complète
tag=input_output|string

text==
Écrire un programme C qui lit une ligne complète sur l'entrée standard puis
réécrit cette ligne sur la sortie standard. Une ligne ne comportera jamais 
plus de 255 caractères. Une ligne se termine par un retour chariot, il faut 
donc utiliser une fonction qui lit jusqu'à voir un retour à la ligne.

==

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){
  /* ...votre code ici... */
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  char s[300];

  fgets(s, 256, stdin);
  printf("%s", s);

  return 0;
}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Test basique", [], "Je vais a la plage.\n"],
 ["Entrée standard vide", [], ""],
 ["Ligne vide mais existante", [], "\n"],
 ["Entrée sur deux lignes", [], "Ceci est une premiere ligne a afficher.\nCeci est une seconde ligne inutile dans cet exercice.\n"]]
==


