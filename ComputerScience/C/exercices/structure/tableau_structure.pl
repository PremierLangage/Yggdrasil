# Copyright 2017 Elise Hardy <ehardy@etud.u-pem.fr>
# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'un tableau de structure

author=Elise Hardy
title=Tableau de structure
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarez une énumaration *Fruit* contenant les fruits *pomme, poire, banane, cerise*.
Puis déclarer une structure *Panier* contenant un tableau de fruit de taille 4. 

==

editor.code==
typedef ...

==

solution==

typedef enum {pomme, poire,banane,cerise}Fruit;

typedef struct {
  Fruit tab[4];
}Panier;

==

codeafter==
 
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
    
int main(int argc, char* argv[]){
  Panier p;
  
  p.tab[0]=p.tab[2]=pomme;
  p.tab[1]=poire;
  p.tab[3]=cerise;
  
  printf("panier: %d %d %d %d",p.tab[0],p.tab[1],p.tab[2],p.tab[3]);
  return 0;
}

==

tests==
[ ["Déclaration et utilisation", "",""] ] 
==

