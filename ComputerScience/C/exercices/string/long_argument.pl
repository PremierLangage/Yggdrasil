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
et d'aller à la ligne.


==

code==
#include ...

int main(...){
  ...
}

==

solution==
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]){
  int i, len_max=0, ind_max=0, current_len;

  if (argc <= 1)
    return 0;

  for (i=1 ; i<argc ; i++){
    current_len = strlen(argv[i]);
    if (current_len > len_max){
      len_max = current_len;
      ind_max = i;
    }
  }

  for (i=0 ; i<len_max+4 ; i++)
    printf("#");
  printf("\n");

  printf("# %s #\n", argv[ind_max]);

  for (i=0 ; i<len_max+4 ; i++)
    printf("#");
  printf("\n");
    
  return 0;
}


==

grader==
[ ["Basique", "argument1", ""],
  ["Sans argument", "", ""],
	["Argument multiple", "12 pouet foo bar 1367235342534", ""],
	["Argument long", "argument1 mot super long anti-constitutionnellement", ""],
	["Complexe", "'argument en plusieurs mots' mot_unique", ""],
  ["Aléatoire", " ".join(["".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))]) for i in range(1, 8)]), ""] ]
==

