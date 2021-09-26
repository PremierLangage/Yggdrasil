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
  <li>retourne `1` si les paramètres de taille des dimensions (évoqués précédemments) sont supérieurs à `0`, sinon retourne `0`</li>
  <li>remplit le tableau à trois dimensions avec des valeurs incrémentées de 1 en 1 (on démarre à 1 et le dernier emplacement aura pour valeur M)</li>
</ul>

Exemple pour un tableau <strong>tab[2][3][5]</strong>, on aura, après avoir appelé la fonction `fill_tab`, le contenu suivant :<br> 
<br>



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
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

