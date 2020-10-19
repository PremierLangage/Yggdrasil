# Revu par Clément BOIN le 19/10/2020
# Déplacement du typedef après les #defin sinon ça ne marche pas ici

title=Initialisation d'une matrice
author = Clément BOIN
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Ecrire une fonction qui alloue une matrice de taille lignes*colonnes et qui 
l'initialise avec des 0.
==

editor.code==
int** allocmatrice_zero (int lig,int col)
{
/*Code à écrire*/
}

==

solution==

int** allocmatrice_zero (int lig,int col)
{
	int i,j;
	int** matrice = malloc(lig*sizeof(int*));
	int val = 0;

	for(i=0;i<lig;i++)
		matrice[i]=malloc(col*sizeof(int));

	for(i=0;i<lig;i++)
		for(j=0;j<col;j++)
		{
			matrice[i][j]=val;
			val++;
		}			

	return matrice;
}
==

codebefore==
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdio.h>

typedef struct{
char  nom[20];
int age;
}Etudiant;
==

codeafter==




int main(int argc, char* argv[]){
  int size = atoi(argv[1]);
  Etudiant* ans;

  srand(time(NULL));

  ans = allouetab(size);
  if (ans == NULL){
    printf("Not Enough Memory.\n");
    return 0;
  }
  if (size >= 2){
    strcpy(ans[0].nom ,"toto");
    ans[0].age=19;
    strcpy(ans[size-1].nom ,"titi");
    ans[size-1].age=91;
    }
  free(ans);
  return 0;
}

==

tests==

[["Exécution simple", "1 1", "0 "]]

==









