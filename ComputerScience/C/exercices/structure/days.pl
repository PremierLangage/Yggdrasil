# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une structure C pour les jours de la semaine

author=Nicolas Borie
title=Structure C pour les jours de la semaine
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarer et définir une *structure* C nommé *Jour*. Cette structure
devra être une énumération des jours de la semaine dont les éléments
seront le nom de chaque jour en francais et tout en minuscules :
lundi, mardi, ...    

==

editor.code==
typedef ...

==

solution==

typedef enum {lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche} Jour;

==

codeafter==
 
#include <stdio.h>
    
int main(int argc, char* argv[]){

  printf("Jour %d\n", lundi);
  printf("Jour %d\n", mardi);
  printf("Jour %d\n", mercredi);
  printf("Jour %d\n", jeudi);
  printf("Jour %d\n", vendredi);
  printf("Jour %d\n", samedi);
  printf("Jour %d\n", dimanche);
  
  return 0;
}

==

tests==
[ ["Déclaration et utilisation", "",""] ] 
==

