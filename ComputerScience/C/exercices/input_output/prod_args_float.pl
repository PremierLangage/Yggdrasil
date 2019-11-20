# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Afficher le produit d'arguments d'un programme

author=Nicolas Borie
title=Produit d'arguments floattants d'un programme
tag=input_output|program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire un programme 
    
==

editor.code==
#include ...

int main(int argc, char* argv[]){
  int a, b;
	
  /** votre code ici... **/
}

==

solution==

#include <stdio.h>

int main(int argc, char* argv[]){
  int a, b;

  scanf("%d %d", &a, &b);
  printf("La somme de %d et %d est %d.\n", a, b, a+b);
  return 0;
}

==

tests==
[["Simple test", "3.141592", "12 3\n"],
 ["Aléatoire", "", str(random.randint(-10,10))+" "+str(random.randint(-10,10))+"\n"],
 ["Aléatoire", "", str(random.randint(-10,10))+" "+str(random.randint(-10,10))+"\n"],
 ["Aléatoire", "", str(random.randint(-10,10))+" "+str(random.randint(-10,10))+"\n"]]
==

