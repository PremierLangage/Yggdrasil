
title=Miroir d'un tableau

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==

Ecrire une fonction `miroir` qui reçoit deux tableaux d'entiers de même taille 
et leur taille, et qui remplit le deuxième avec l'image 
miroir du premier.<p>
Exemple : Si le premier tableau de taille 5 contenait 1,2,3,4,5, le deuxième contient 5,4,3,2,1 après éxécution de la fonction.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
..miroir(...)
==

solution==
void miroir(int tab[],int res[], int size){

  int i;

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
miroir(tab,res,size);
for(i=0;i<size;i+=1)
    printf("%d ",res[i]);
  printf("\n");

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
   ["aléatoire1 ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire2 ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==










