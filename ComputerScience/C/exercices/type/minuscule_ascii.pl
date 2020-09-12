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
title=Caractères minuscules ASCII

tag=C|type|

text==

Écrire un programme C qui affiche, pour chaque lettre minuscule, sur une ligne les données suivante :

    lettre --> code_décimal_de_la_lettre
    
Attention, il y a un espace avant et après la flèche. Il y a un retour à la ligne juste après le 
code décimal de la lettre.
==

editor.code==
#include <stdio.h>

int main(){
  ...
  printf(" --> ");
  ...
}
==

solution==
#include <stdio.h>

int main(){
  char c;

  for (c='a' ; c<='z' ; c++)
    printf("%c --> %d\n", c, c);
  return 0;
}
==

code_before==
==
code_after==
==

checks_args_stdin==
[["Simple exécution", [], ""]]
==




