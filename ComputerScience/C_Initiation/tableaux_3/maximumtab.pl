
title=Maximum d'un tabeau
tag=tab
extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==

Ecrire une fonction `int max_tab(int t[],int taille)` qui reçoit un tableau et sa taille (>0) et renvoie son maximum.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int max_tab(int tab[], int size){
 ...
  
} 
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }

  printf("Le maximum des entiers est %d\n", max_tab(tab, size));

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
 
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==






