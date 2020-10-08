

title=Plus long plateau
tag=tableau
extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==
Ecrire une fonction de protopype `int plateau(int tab[],int taille,int *debut );` qui reçoit un tableau d'entiers et sa taille,
 renvoie la longueur de la plus longue partie du tableau constitué d'éléments égaux, et place à l'adresse $%{ \tt debut}%$
 l'indice de son premier élément. <br> En cas d'égalité, on gardera le plus petit indice.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int plateau(int t[], int taille,int *debut){
  /* Votre code ici */
}
==
#La solution plante, cf le test ajouté "test qui plante"
solution==
int plateau(int t[], int taille,int *debut){
  int debcourant,debmax,i;
  int lcourant,lmax;
  debcourant=debmax=0;
  lcourant=lmax=1;
  for (i=1;i<taille;i++){
    if(t[i]==t[debcourant])
      lcourant++;
    else{
      if(lmax<lcourant){
        lmax=lcourant;
        debmax=debcourant;
      }
      debcourant=i;
      lcourant=1;
    }

  }
 *debut=debmax;
  return lmax;
}
 
==

codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;int deb,lg;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }
lg=plateau(tab,size,&deb);
  printf("le plus grand plateau mesure %d et commence en %d\n",lg,deb);
  return 0;
}
==

# L'aléatoire peut sortir des trucs comme "1566666666666666-2"
tests==
[ ["simple éxécution", "","1 2  2 4 5"],
  ["avec deux ", "","-1 -2"],
  ["avec un ", "","-1"],
  ["test qui plante", "", "-7 10 17 3 18 20 8 -3 -1 15 -6 -15 8 7 -8 -12 -19 -19"],
  ["aléatoire ", ""," ".join([str(random.randint(10,20)) for i in range(random.randint(5,10))])+"6"*14+" ".join([str(random.randint(-10,10)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==








