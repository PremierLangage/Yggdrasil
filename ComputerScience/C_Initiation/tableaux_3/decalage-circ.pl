title=Décalage circulaire

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|ComparaisonContigues

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==
Écrire une fonction `void decaleDG(int tab1 [], tab2 [], int taille)` qui reçoit deux tableaux, `tab1` et `tab2`, 
ainsi que leur taille et effectue un d'écalage circulaire d'une case vers la droite pour `tab1`, et d'une case vers la gauche pour `tab2`.
<p>
Exemple
avec taille 5 : <br>
- si tab1 contient $%1,2,3,4%$ et tab2 contient $%1,2,3,4%$ , 
après l'éxécution de decaleDG(tab1,tab2,5), tab1 contiendra $%4,1,2,3%$ et tab2 $%2,3,4,1%$.

==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 256

==

editor.code==
/* Retour */ decalDG(/* Paramètres */){

}
==

solution==
void decaleDG(int tab1[],int tab2[],int size)
{
    int val = tab1[size-1], i;
    for (i = 1; i < size; i++)
        tab1[i] = tab1[i-1];
    tab1[0] = val;
    val = tab2[0];
    for (i = 1; i < size; i++)
        tab2[i-1] = tab2[i];
    tab2[size-1] = val;
}
==

codeafter==
int main(int argc, char* argv[]){
  int tab1[MAX],tab2[MAX];
  int lu;
  int i;
  int size;
  scanf("%i",&size);
  for (i = 0; i < size; i++) {
    scanf("%d",&lu);
    tab1[i] = lu;
  }
  for (i = 0; i < size; i++) {
    scanf("%d",&lu);
    tab2[i] = lu;
  }
  decaleDG(tab1,tab2,size);
  printf("tab1 :");
  for (i = 0; i < size; i++)
    printf(" %i",tab1[i]);
  printf("\ntab2 :");
  for (i = 0; i < size; i++)
    printf(" %i",tab2[i]);
  return 0;
}
==

# MAX était donné comme valeur comme en C dans les tests, ça faisait tout planter, il faut le mettre à la main
tests==
[ ["croissante 1", "","-1 2 5 8 78"] ,
["pas croissante", "","-1 2 8 5 78"] ,
["croissante 2", ""," ".join([str(0) for i in range(15)]) ],
["croissante 3", ""," ".join([str(i) for i in range(5)]) ],
["aléatoire 1 ", ""," ".join([str(random.randint(-20,20)) for i in range(5)])], 
["aléatoire 2 ", ""," ".join([str(random.randint(0,20)) for i in range(3)])],

]
==























