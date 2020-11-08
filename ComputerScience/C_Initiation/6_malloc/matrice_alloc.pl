title=Initialisation d'une matrice d'entiers
#author = Clément BOIN
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Ecrire une fonction qui alloue et renvoie une matrice d'entiers de taille lignes*colonnes 
et qui l'initialise avec la valeur 0 dans toutes les cases.
==

editor.code==
... allocmatrice_zero (int lig,int col)
{
/*Code à écrire*/
}

==

solution==

int** allocmatrice_zero (int lig,int col)
{
	int i,j;
	int** matrice = malloc(lig*sizeof(int*));

	for(i=0;i<lig;i++)
		matrice[i]=malloc(col*sizeof(int));

	for(i=0;i<lig;i++)
		for(j=0;j<col;j++)
			matrice[i][j]=0;		

	return matrice;
}
==

codebefore==
#include <stdlib.h>
#include <stdio.h>

==

codeafter==
int main(int argc, char* argv[]){

	int i,j;
	int ** mat;
	int lignes = atoi(argv[1]);
	int colonnes = atoi(argv[2]);

	mat = allocmatrice_zero(lignes,colonnes);

	for(i=0;i<lignes;i++)
	{
		for(j=0;j<colonnes;j++)
		{
			printf("%d ",mat[i][j]);
		}
		printf("\n");
	}

  return 0;
}

==

tests==

[["Exécution simple", "1 1", "0 "],
 ["Matrice vide", "0 0", ""],
 ["Matrice carée","4 4","0 0 0 0 \n0 0 0 0 \n0 0 0 0 \n0 0 0 0 \n"],
 ["Matrice à 3 lignes et 2 colonnes","3 2","0 0 \n0 0 \n0 0 \n"]
 ]

==












