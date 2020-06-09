
title=Calcul du nombre d'inersions
tag=tri
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Ecrire une fonction de protopype `int nb_inversions(int tab[],int taille);` qui renvoie le nombre d'inversions dans le tableau.<br>
On rappelle qu'une inversion dans un tableau $%t%$ est un couple (i,j) avec $%0 \leq i \lt j%$ et $%t[i]>t[j]%$  
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int nb_inversions(int tab[], int size){
  int i,j;
   int nb=0;

  for(i=0 ; i<size ; i++)
    for(j=i+1;j<size;j++)
        if (tab[i] > tab[j])
            nb++;
  
  return nb;
} 
==

solution==
int nb_inversions(int tab[], int size){
  int i,j;
   int nb=0;

  for(i=0 ; i<size ; i++)
    for(j=i+1;j<size;j++)
        if (tab[i] > tab[j])
            nb++;
  
  return nb;
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

  printf("la suite comprends %d inversion(s)\n",nb_inversions(tab,size));
  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
  ["avec deux négatifs", "","-1 -2"],
  ["aléatoire négatif", ""," ".join([str(random.randint(-30,-5)) for i in range(random.randint(5,10))])],
  ["aléatoire positif", ""," ".join([str(random.randint(0,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-100,100)) for i in range(random.randint(10,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==




