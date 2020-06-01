
title=Mirroir d'un tableau
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `mirroir` qui reçoit deux tableaux d'entiers de même taille 
et leur taille, et qui remplit le deuxième avec l'image 
mirroir du premier.<br
Exemple
Si le premier tableau de taille 5 contenait 1,2,3,4,5,<br>
le deuxième contient 5,4,3,2,1 après éxécution de la fonction.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
..mirroir(...)
==

solution==
oid mirroir(int tab[],int res[], int size){

v  int i;

  for(i=0 ; i<size ; i++){
        res[i]=tab[size-i-1];
  }

}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100],res[100];
  int size = 0;
  int lu,i;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }
mirroir(tab,res,size);
for(i=0;i<size;i+=1)
    printf("%d ",res[i]);
  printf("\n");

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





