#*****************************************************************************
#  Copyright (C) 2020 Marc Zipstein
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Initialisation d'un tableau à trois dimensions

tag=tableau|fonction|parcours|difficile|dimension

author=Olivier Champalle

editor.height=350px

text==#|markdown|
 
Ecrire une fonction `void fill_tab(int LI, int COL, int N, int tab[][COL][N])` qui : 

<ul>
  <li>reçoit en paramètre un tableau d'entier à <u>trois dimensions</u> et les paramètres permettant d'en décrire les tailles respectives</li>
  <li>remplit le tableau à trois dimensions avec des valeurs incrémentées de 1 en 1 (on démarre à 1 et le dernier emplacement aura pour valeur `M = LI x COL x N`)</li>
</ul>

Exemple pour un tableau `tab[2][3][5]`, on aura, après avoir appelé la fonction `fill_tab`, le contenu suivant :

    [ 1, 2, 3, 4, 5] [ 6, 7, 8, 9,10] [11,12,13,14,15]
    [16,17,18,19,20] [21,22,23,24,25] [26,27,28,29,30]

Un tableau à trois dimension peut être vu comme un tableau de plusieurs matrices ou bien une matrice
contenant des tableaux. Nous avons fait ici le second choix. Dans l'exemple au dessus, `9` est l'élément
de coordonnées `(0, 1, 3)`. Autrement dit   
`tab[0][1][3] = 9`, la première coordonnée donne la ligne, la seconde coordonnée donne la colonne et enfin 
la troisième donne l'emplacement dans le tableau.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
==

editor.code==#|c|
void fill_tab(int LI, int COL, int N, int tab[][COL][N]){
  // Votre code ici...
}
==

solution==#|c|
void fill_tab(int LI, int COL, int N, int tab[][COL][N]){
	int i,j,k;
	int var=1;

	for(i=0;i<LI;i=i+1)
		for(j=0;j<COL;j=j+1)
			for(k=0;k<N;k=k+1){
				tab[i][j][k]= var;
				var=var+1;
			}
}
==

code_after==#|c|
int display(int LI, int COL, int N, int t[][COL][N]){
	int i,j,k;
    int max = 0;
    int gab = 0;

    for(i=0;i<LI;i=i+1){
        for(j=0;j<COL;j=j+1){
            for(k=0;k<N;k=k+1){
                if (t[i][j][k] > max)
                    max = t[i][j][k];
            }
        }
    }
    while(max > 0){
        gab += 1;
        max = max / 10;
    }

	for(i=0;i<LI;i=i+1){
		for(j=0;j<COL;j=j+1){
			for(k=0;k<N;k=k+1){
				if(k==0) printf("[");
					printf("%*d", gab, t[i][j][k]);
						if(k==(N-1))
							printf("]");
						else
							printf(",");
					}
				if (j==(COL-1))
					printf("\n");
				else
					printf(" ");
			}
		}
    return 1;
}

int main(int argc, char* argv[]){
 
 	int LI,COL,N;

 	LI=atoi(argv[1]);
 	COL=atoi(argv[2]);
 	N=atoi(argv[3]);

    int tab[LI][COL][N];
	
	fill_tab(LI,COL,N, tab);
	display(LI,COL,N,tab);

	return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["1", "2", "3"], ""],
  ["Exemple énoncé", ["2", "3", "5"], ""],
  ["Test aléatoire 1", [str(randint(9,15)), str(randint(2,4)), str(randint(2,5))], ""],
  ["Test aléatoire 2", [str(randint(9,15)), str(randint(2,4)), str(randint(2,5))], ""],
  ["Test aléatoire 3", [str(randint(9,15)), str(randint(2,4)), str(randint(2,5))], ""] ]
==

astuces==#|python|
[
  { "content": """Pour opérer un tel ramplissage, il faudra imbriquer trois boucles `for` les unes dans les autres."""},
  { "content": """De manière croissante (en commençant par `0` puis en incrémentant), il faut itérer d'abord sur les lignes, puis sur les colonnes et enfin sur les positions possibles."""},
  { "content": """Le plus simple pour égrainer les entiers est d'utiliser une variable locale, initialisé à `1` que l'on insère progressivement et que l'on incrémente petit à petit."""}
]
==

