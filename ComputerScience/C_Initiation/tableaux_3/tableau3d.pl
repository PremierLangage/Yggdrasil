
title= Tableau à 3 dimensions

tag=tableau|fonction|

extends=/ComputerScience/C/template/stdsandboxC.pl

author= M2105

text==  
 
Ecrire une fonction `fill_tab(....)` qui : 

<ul>
  <li>reçoit en paramètre un tableau d'entier à <u>trois dimensions</u> et les paramètres permettant d'en décrire les tailles respectives</li>
  <li>retourne `1` si les paramètres de taille des dimensions (évoqués précédemments) sont supérieurs à `0`, sinon retourne `0`</li>
  <li>remplit le tableau à trois dimensions avec des valeurs incrémentées de 1 en 1 (on démarre à 1 et le dernier emplacement aura pour valeur M)</li>
</ul>

Ecrire une fonction `display(....)` qui : 

<ul>
  <li>reçoit en paramètre un tableau d'entier à <u>trois dimensions</u> et les paramètres permettant d'en décrire les tailles respectives</li>
  <li>retourne `1` si les paramètres de taille des dimensions (évoqués précédemments) sont supérieurs à `0`, sinon retourne `0`</li>
  <li>affiche le tableau de la manière suivante (en comptant lignes et colonnes à partir de 1) : <br> Ligne Z || Colonne X {valeur,valeur} | Colonne Y {valeur,valeur} |</li>
</ul>

Exemple pour un tableau <strong>tab[2][3][5]</strong> on aura, après avoir appelé la fonction `fill_tab` puis `display` sur ce tableau, l'affichage suivant :<br> 
<br>
`Ligne 1 || Colonne 1 {1,2,3,4,5} | Colonne 2 {6,7,8,9,10} | Colonne 3 {11,12,13,14,15} |`<br>
`Ligne 2 || Colonne 1 {16,17,18,19,20} | Colonne 2 {21,22,23,24,25} | Colonne 3 {26,27,28,29,30} |`<br>

Dans cet exemple M = 2$%\times%$3$%\times%$5 = 30 <br>
<br>
<strong>Ne changez pas l'ordre ni le nom des fonctions</strong>
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

==

editor.code==
void fill_tab(........, int tab[][COL][N]){

/* à compléter */

}

void display (.......) {

/* à compléter */

}
==

solution==

int fill_tab(int LI, int COL, int N, int tab[][COL][N]){
	
	int i,j,k;
	int var=1;

	if (LI>0 && COL>0 && N >0){
		for(i=0;i<LI;i=i+1)
			for(j=0;j<COL;j=j+1)
				for(k=0;k<N;k=k+1){
					tab[i][j][k]= var;
					var=var+1;
				}
		return 1;
	}

	return 0;
}

int display(int LI, int COL, int N, int tab[][COL][N]){

	int i,j,k;

	if (LI>0 && COL>0 && N >0){
		for(i=0;i<LI;i=i+1){
			printf("Ligne %d || ",i+1);
			for(j=0;j<COL;j=j+1){
				printf("Colonne %d ",j+1);
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
		return 1;
	}

	return 0;
}

==

codeafter==

int main(int argc, char* argv[]){
 
 	int LI,COL,N;

 	LI=atoi(argv[1]);
 	COL=atoi(argv[2]);
 	N=atoi(argv[3]);

	int tab[LI][COL][N];
	
	if (fill_tab(LI,COL,N,tab)==1)
		if (display(LI,COL,N,tab)==1)
			return 1;

	return 0;
}

==

tests==
[ ["simple éxécution", "1 2 3",""],
  ["aléatoire 1 ", str(random.randint(1,5))+" "+str(random.randint(9,15))+" "+str(random.randint(1,5)), ""],
  ["aléatoire 2 ", str(random.randint(9,15))+" "+str(random.randint(1,6))+" "+str(random.randint(3,7)), ""]
   ]
==








