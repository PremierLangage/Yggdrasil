title=Décalage circulaire

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==

Écrire une fonction `decaleDG` qui reçoit deux tableaux d'entiers de même taille 
et leur taille, et qui fait décalage circulaire à droite du premier et le décalage circulaire à gauche du deuxième. 


<p>
Exemple : Si les tableaux sont de taille 4, le premier contient 1,2,3,4,
 et le deuxième contient 5,6,7,8, alors après éxécution de la fonction
 le premier contiendra 4,1,2,3 tandis que le deuxième 6,7,8,5.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
/* retour */ decaleDG(/* Paramètres */) {

}
==

solution==
void decaleDG(int tab1[],int tab2[],int size)
{
    int val = tab1[size-1], i;
    for (i = size-1; i >=1; i--)
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
  int tab1[100],tab2[100];
  int lu,i,size;

  scanf("%d",&size);
  printf("Taille : %d\n",size);

  printf("Input Premier tableau :\n");
  for (i = 0; i < size; i+=1)
  {
    scanf("%d", &lu);
    tab1[i] = lu;
    printf("%d ",lu);
  }
  printf("\nInput Deuxieme tableau :\n");
  for (i = 0; i < size; i+=1)
  {
    scanf("%d", &lu);
    tab2[i] = lu;
    printf("%d ",lu);
  }

 decaleDG(tab1,tab2,size);
  printf("\nResultat premier tableau :\n");
  for (i = 0; i < size; i+=1)
    printf("%d ",tab1[i]);
  printf("\nResultat deuxieme tableau :\n");
  for (i = 0; i < size; i+=1)
    printf("%d ",tab2[i]);
  printf("\n");

  return 0;
}
==


tests==
[ ["simple éxécution", "","4\n1 2 3 4\n 6 7 8 9"],
   ["aléatoire 1", "","10\n"+" ".join([str(random.randint(-20,20)) for i in range(20)])],
   ["aléatoire 2", "","20\n"+" ".join([str(random.randint(-20,20)) for i in range(40)])],
]
==











