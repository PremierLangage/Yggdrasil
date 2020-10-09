title=Tableau Croissant

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|ComparaisonContigues

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
text==

Écrire une fonction `est_croissante` qui reçoit un tableau de taille MAX (*) et renvoie 1
 si les entiers sont en ordre strictement croissant, et 0 sinon. <br>

<p>
Exemple
avec MAX valant 5 : <br>
- si tab contient $%-4,5,10,14,1%$, est_croissante(tab) renvoie $%0%$,<br>
- Si tab contient $%5,6,8,75,82%$, est_croissante(tab) renvoie $%1%$.<br>

<p>
(*) MAX est une constante symbolique définie par #define MAX XXXXX, où XXXXX est un entier positif.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX random.randint(0,20)

==

editor.code==
/* Retour */ est_croissante(/* Paramètres */){

}
==

solution==
int est_croissante(int tab[]){
  int i=1;
for(;i<MAX;i+=1){
    if (tab[i-1] >= tab[i])
      return 0;
      }
  return 1;
}
==

codeafter==
int main(int argc, char* argv[]){
  int tab[MAX];
  int lu;
  int i;
  for (i = 0; i < MAX; i++) {
    scanf("%d",&lu);
    tab[i] = lu;
  }
  printf("-->%d\n",est_croissante(tab));

  return 0;
}
==

# MAX était donné comme valeur comme en C dans les tests, ça faisait tout planter, il faut le mettre à la main
tests==
[ ["croissante 1", "","-1 2 5 8 78"] ,
["pas croissante", "","-1 2 8 5 78"] ,
["croissante 2", ""," ".join([str(0) for i in range(15)]) ],
["croissante 3", ""," ".join([str(i) for i in range(15)]) ],
["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(15)])], 
["aléatoire ", ""," ".join([str(random.randint(0,20)) for i in range(15)])] 
]
==

















