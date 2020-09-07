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

title=Afficher les arguments d'un programme C
tag=program

text==

Écrire un programme C qui affiche ses arguments. Le programme ne devra
pas afficher son nom qui est toujours positionné en tête du tableau
des arguments. On affichera un argument par ligne. Exécuté sans
argument, le programme ne doit donc rien afficher.
    
==

editor.code==
#include ...

int main(...){
  ...
}

==

code_before==
==

code_after==
==

solution==
#include <stdio.h>

int main(int argc, char* argv[]){
  int i;

  for (i=1 ; i<argc ; i++)
    printf("%s\n", argv[i]);
    
  return 0;
}


==

tests==
[["Basique", "argument1", ""],
["Sans argument", "", ""],
["Argument multiple", "arg1 arg2 arg3 arg4", ""],
["Mélange", "argument1 192 poule foo 42", ""],
["Complexe", "'argument en plusieurs mots' mot_unique", ""]]
==


