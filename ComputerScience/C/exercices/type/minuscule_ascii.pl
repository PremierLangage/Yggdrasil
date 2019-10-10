# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
author=Nicolas Borie
title=Caractères minuscules ASCII
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme C qui affiche ses arguments. Le programme ne devra
pas afficher son nom qui est toujours positionné en tête du tableau
des arguments. On affichera un argument par ligne. Exécuté sans
argument, le programme ne doit donc rien afficher.
    
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



