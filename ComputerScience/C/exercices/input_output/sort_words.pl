# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Trier des mots lus sur l'entrée standard.

author=Nicolas Borie
title=Trier des mots lus sur l'entrée standard
tag=input_output|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==


Écrire un programme qui lit des mots sur l'entrée standard puis réécrit 
ses mots sur la sortie standard (un par ligne) mais de manière triée. Il y 
aura au plus 100 mots sur l'entrée standard et chacun de ces mots comportera 
au plus 63 caractères.

Par exemple, si l'entrée standard contient

    Pommes
    Poires
    Patates
    Peche

Alors votre programme devra afficher

    Patates
    Peche
    Pommes
    Poires

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
  char tab[100][64];
  int nb_mots = 0;

  return 0;
}


==

tests==
[["Basique", "", "Je vais a la plage.\n"],
 ["Entree vide", "", ""],
 ["ligne vide mais existante", "", ""],
 ["Deux lignes", "", "Ceci est une premiere ligne a afficher.\nCeci est une seconde ligne inutile dans cet exercice.\n"]]
==


