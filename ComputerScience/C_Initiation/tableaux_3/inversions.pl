
title=Calcul du nombre d'inversions

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl

author=

text==
Ecrire une fonction de protopype `int nb_inversions(int tab[],int taille);` qui renvoie le nombre d'inversions dans le tableau.<br>
Rappel: Une inversion dans un tableau $%t%$ est un pair d'indices `i<j` du tableau, tels que $% t[i]>t[j] %$.
<p>
Exemples : <br>
- Si le tableau contenait 1,3,2 les inversions sont les pairs `(i,j)` suivants : `(1,2)`. <br>
- Si le tableau contenait 1,3,2,0 les inversions sont les pairs `(i,j)` suivants : `(0,3),(1,2),(1,3),(2,3)`. 

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int nb_inversions(int tab[], int size){
 
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









