# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Récupérer une phrase complète sur l'entrée standard

author=Nicolas Borie
title=Récupérer puis écrire une phrase complète
tag=input_output|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme C qui lit une phrase complète sur l'entrée standard puis
réécrit cette phrase sur la sortie standard. Une ligne ne comportera jamais 
plus de 255 caractères.

==

editor.code==
#include ...

int main(int argc, char* argv[]){
  /* ...votre code ici... */
}

==

solution==

#include <stdio.h>

int main(int argc, char* argv[]){
  char s[300];

  fgets(s, 256, stdin);
  printf("%s", s);

  return 0;
}


==


tests==

[["Basique", "", "Je vais a la plage.\n"],
 ["Entree vide", "", ""],
 ["Deux lignes", "", "Ceci est une premiere ligne a afficher.\nCeci est une seconde ligne inutile dans cet exercice.\n"]]

==

