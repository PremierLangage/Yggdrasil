
title= Tableau à 3 dimensions

tag=

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==  
 
Ecrire une fonction `raun()` qui : 

<ul>
  <li>reçoit en paramètre un tableau à <u>trois dimensions</u> et retourne un <strong>int</strong></li>
  <li>remplie le tableau à trois dimensions avec des valeurs incrémentées de 1 en 1 (on démarre à 1 et le dernier emplacement aura pour valeur N)</li>
  <li>affiche le tableau de la manière suivante : Ligne Z || Colonne X {valeur,valeur} | Colonne Y {valeur,valeur} |</li>
</ul>

Exemple pour un tableau <strong>tab[2][3][5]</strong> on aura :<br> 

`Ligne 1 || Colonne 1 {1,2,3,4,5} | Colonne 2 {6,7,8,9,10} | Colonne 3 {11,12,13,14,15} |`<br>
`Ligne 2 || Colonne 1 {16,17,18,19,20} | Colonne 2 {21,22,23,24,25} | Colonne 3 {26,27,28,29,30} |`<br>

Dans cet exemple N = 2$%\times%$3$%\times%$5 = 30

==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

==

editor.code==
int raun(........, int tab[][COL][N]){



}
==

solution==
int raun(int LI, int COL, int N, int tab[][COL][N]){
	
	int i,j,k;
	int var=1;

	for(i=0;i<LI;i=i+1)
		for(j=0;j<COL;j=j+1)
			for(k=0;k<N;k=k+1){
				tab[i][j][k]= var;
				var=var+1;
			}

	for(i=0;i<LI;i=i+1){
		printf("Ligne %d || ",i+1);
		for(j=0;j<COL;j=j+1){
			printf("Colonne %d ",j+1);
			/*if (j==0) printf("{");*/
				for(k=0;k<N;k=k+1){
					if(k==0) printf("{");
					printf("%d",tab[i][j][k]);
					if(k==(N-1))
						printf("}");
					else
						printf(",");
				}
			if (j==(COL-1))
				printf(" |\n");
			else
				printf(" | ");
		}
	}

	return 0;
}
==

codeafter==

int main(int argc, char* argv[]){

    /* On commence par initialiser le générateur de nombre pseudo-aléatoires.*/
    srand(time(NULL));

 	int LI,COL,N;

    while ((LI = rand()%5) < 1);
    while ((COL = rand()%5) < 1);
    while ((N = rand()%5) < 1);

	int tab[LI][COL][N];
	
	raun(LI,COL,N,tab);

	return 0;
}
==

tests==
[ ["simple éxécution", "",""]
   ]
==




