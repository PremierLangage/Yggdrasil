

title=Plus long plateau

tag=Tableau|Fonction|TransmissionParametre|TransmissionAdresse|ParcoursTableau

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==
Ecrire une fonction de protopype `int plateau(int tab[],int taille,int *debut);` qui reçoit un tableau d'entiers et sa taille,
 renvoie la longueur de la plus longue partie du tableau constituée d'éléments égaux, et place à l'adresse $%{ \tt debut}%$
 l'indice du premier élément du plateau. <br> En cas d'égalité, on gardera le plus petit indice.
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
solution==
int plateau(int t[], int taille,int *debut){
    int len = 0, i;
    *debut = 0;
    int cur = 0;
    for (i = 1; i < taille; i++)
    {
        if (t[i]==t[i-1])
            cur++;
        else
            cur = 0;
        if (cur > len)
        {
            len = cur;
            *debut = (i-len);
        }
    }
    return len+1;
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

# L'aléatoire marche maintenant
tests==
[ ["simple éxécution", "","1 2  2 4 5"],
  ["avec deux ", "","-1 -2"],
  ["avec un ", "","-1"],
  ["plateau en fin", "", "-7 10 17 3 18 20 8 -3 -1 15 -6 -15 8 7 -8 -12 -19 -19"],
  ["aléatoire 1", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])],
  ["aléatoire 2 ", ""," ".join([" ".join([str(random.randint(-20,20))]*(random.randint(1,10))) for i in range(random.randint(5,20))])],
  ["aléatoire 3", ""," ".join([" ".join([str(random.randint(0,10))]*(random.randint(1,3))) for i in range(random.randint(10,20))])],
  ["aléatoire 4", ""," ".join([" ".join([str(random.randint(0,100))]*(random.randint(1,10))) for i in range(random.randint(5,20))])+" 10 "*11],
   ]
==












