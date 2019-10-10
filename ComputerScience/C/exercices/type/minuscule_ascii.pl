# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
author=Nicolas Borie
title=Caractères minuscules ASCII
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

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

tests==
[["Simple exéécution", "", ""]]
==



