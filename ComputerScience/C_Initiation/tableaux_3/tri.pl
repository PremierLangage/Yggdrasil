
title=Tri d'un tableau

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|TransmissionAdresse|Tri

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==

Ecrire une fonction `tri` qui reçoit un tableau d'entiers et sa taille, et qui transforme le tableau en un tableau trié en ordre croissant<br><p>
Exemple :
Si le  tableau de taille 5 contenait 5,3,2,4,1,
il contient 1,2,3,4,5 après éxécution de la fonction.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==
 
editor.code==
... tri(...)
==

solution==

void tri(int a [], int size)
{
    int i,aux;
    for (i = 1; i < size; i++)
    {
        int val = a[i], j = i-1;
        while (j>=0 && val < a[j])
        {
            a[j+1] = a[j];
            j--;
        }
        a[j+1] = val;
    }
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












