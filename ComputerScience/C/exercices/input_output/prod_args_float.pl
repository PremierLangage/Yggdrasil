# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Afficher le produit d'arguments d'un programme

author=Nicolas Borie
title=Produit d'arguments floattants d'un programme
tag=input_output|program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire un programme qui affiche le produit de tous les arguments que l'on 
lui a transmis lors de son appel. Les arguments seront tous des chaînes décrivant
des nombres flottants (convertissable avec la fonction **atof** de **<stdlib.h>**).
Une fois récupérés, votre programme devra afficher la phrase suivante : 
**Le produit des arguments est XXXX.** (avec un point à la fin de la ligne et un retour
chariot). XXXX devra être remplacé par le produit de tous les arguments.

Pour information, un produit vide (comme tout nombre à la puissance zéro) vaut 1.
    
==

editor.code==
#include ...

int main(int argc, char* argv[]){	
  /** votre code ici... **/
}

==

solution==

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int a, b;

  scanf("%d %d", &a, &b);
  printf("La somme de %d et %d est %d.\n", a, b, a+b);
  return 0;
}

==

tests==
[["Simple test", "3.141592", ""],
 ["Pas d'argument", "", ""],
 ["6 arguments triviaux", "1.0 1.0 1 1 1.0000 1.", ""],
 ["Aléatoire", "", ""],
 ["Aléatoire", "", ""]]
==

