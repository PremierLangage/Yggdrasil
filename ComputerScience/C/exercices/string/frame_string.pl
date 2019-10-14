# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Encadrer une chaine de caractères C

author=Nicolas Borie
title=Encadrer une chaine de caractères C
tag=string|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction C qui prend en argument une chaîne de caractères
et qui affiche cette chaîne de manière encadrée avec des caractères \#.


Ainsi, si le mot est "pouet", la fonction devra alors afficher:

    #########
    # pouet #
    #########

Le cadre est espacé du mot d'un espace avant et après la chaîne.
On affichera rien du tout si la chaîne en argument est la chaîne vide.
==

editor.code==
#include <stdio.h>
#include <string.h>

... frame_string(...){
  ...
}

==

solution==
#include <stdio.h>
#include <string.h>    

void frame_string(char* text){
  int len=strlen(text)+4;
  int i;

  if (len == 4)
      return ;
  
  for (i=0 ; i<len ; i++)
      printf("#");
  printf("\n");
  printf("# %s #\n", text);
  for (i=0 ; i<len ; i++)
      printf("#");
  printf("\n");
}

==

codeafter==

int main(int argc, char* argv[]){
  frame_string(argv[1]);
  return 0;
}

==

    
tests==
[ ["Basique", "pouet", ""],
  ["Chaîne composé", '"deux mots"', ""],
  ["Chaîne vide", '""', ""],
  ["Long mot", "Anti-constitutionnellement", ""],
  ["Plein de mots", '"Cela fait sept mots dans un mot"', ""] ]
==

