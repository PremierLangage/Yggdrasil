# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Trouver le plus long argument d'un programme C

author=Nicolas Borie
title=Trouver le plus long argument d'un programme C
tag=string|program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme C qui identifie et affiche son argument le plus long. 
Une fois ce dernier identifié, il suffit de l'afficher sur la sortie standard 
**sans oublier d'aller à la ligne après l'affichage**.

==

editor.code==
#include ...

int main(...){
  ...
}

==

solution==

#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]){
  int i, ind_max=1;

  if(argc == 1)
    return 0;

  for(i=2 ; i<argc ; i++){
    if(strlen(argv[i]) > strlen(argv[ind_max]))
      ind_max = 1;
  }

  printf("%s\n", argv[ind_max]);
    
  return 0;
}

==

tests==
[ ["Basique", "argument1", ""],
  ["Sans argument", "", ""],
	["Argument multiple", "12 pouet foo bar 1367235342534", ""],
	["Argument long", "argument1 mot super long anti-constitutionnellement", ""],
	["Complexe", "'argument en plusieurs mots' mot_unique", ""],
  ["Aléatoire", " ".join(["".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))]) for i in range(1, 8)]), ""] ]
==

