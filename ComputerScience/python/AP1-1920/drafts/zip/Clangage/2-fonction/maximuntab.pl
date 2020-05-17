
title=Programme manipulant des types
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Le programme suivant comporte des erreurs. Corrigez ces erreurs ! 
Attention, cette fonction étant intégrée dans un programme pour les tests, vous ne 
pouvez pas changer son propotype.

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int max(int tab[], int size){
  int i;
  unsigned int max=0;

  for(i=0 ; i<size ; i++){
    if (tab[i] > max)
      max = tab[i];
  }
  return max;
} 
==

solution==

int max(int tab[], int size){
  int i;
  int max=tab[0];

  for(i=1 ; i<size ; i++){
    if (tab[i] > max)
      max = tab[i];
  }
  return max;
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

  printf("Le maximum des entiers reçus ur l'entrée standard est %d\n", max(tab, size));

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



