
title=Comparaison de deux tableaux

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==

Ecrire une fonction `identique_tab` qui reçoit deux tableaux d'entiers de même taille 
et leur taille, et qui renvoie 1 si les deux tableaux sont identiques (mêmes éléments dans le même ordre) et 0 sinon.<br>
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include<time.h>

==

editor.code==
int identique_tab(/* Paramètres*/){
  /* Votre code ici */
}
==

solution==
int identique_tab(int tab[],int deu[], int size){

  int i;

  for(i=0 ; i<size ; i++){
    if( deu[i]!=tab[i])
        return 0;
  }
  return 1;
}
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100],cop[100],dif[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    dif[size]=cop[size]=tab[size] = lu;
   size++;
  }
  dif[size-1]=tab[size-1]+random.randint(1,100) * (1-2*random.randint(0,1));

if (identique_tab(tab,cop,size)==1)
    printf(" tableaux identiques \n");
else
  printf("tableaux différents \n");
if (identique_tab(tab,dif,size)==1)
     printf(" tableaux identiques \n");
else
  printf("tableaux différents \n");
return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
   ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==














