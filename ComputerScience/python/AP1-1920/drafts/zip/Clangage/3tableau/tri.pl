
title=Tri d'un tableau
tag=tableau
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `tri` qui reçoit un tableau d'entiers et sa taille, et qui transforme le tableau en un tableau trié en ordre croissant<br>
Exemple
Si le  tableau de taille 5 contenait 1,2,3,4,5,<br>
il contient 1,2,3,4,5 après éxécution de la fonction.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
int comp(int *a,int*b){
return *a-*b;
}
==
 
editor.code==
..mirroir(...)
==

solution==

void tri(int tab[],int size){

  int i;

  qsort(tab,size,sizeof(int),comp);


}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu,i;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }
tri(tab,size);
for(i=0;i<size;i+=1)
    printf("%d ",tab[i]);
  printf("\n");

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
   ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==






