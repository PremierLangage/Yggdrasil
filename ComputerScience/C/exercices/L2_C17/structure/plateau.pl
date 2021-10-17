#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#  Copyright (C) 2017 Elise Hardy <ehardy@etud.u-pem.fr>
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

author=Elise Hardy

title=Structure C pour un plateau rectangulaire
tag=structure

text==#|markdown|
Déclarer et définir une *structure* C nommé *Plateau*. Cette structure
devra contenir trois champs : un tableau d'entiers à deux dimensions nommé *tab*, 
un entier *n* et un entier *k* donnant les tailles du plateau.

==

editor.code==#|c|
typedef ...
==

solution==#|c|
typedef struct {
char **tab;
int n;
int k;
}Plateau;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]){
	Plateau P;

	P.n = atoi(argv[1]);
	P.k = atoi(argv[2]);

	if(P.n < 0 || P.k < 0){
		printf("Erreur un plateau ne peut avoir des dimensions négatives");
		return 0;
	}
	P.tab=malloc(sizeof(int*)*P.n);
	if(P.tab == NULL){
		exit(EXIT_FAILURE);
	}
	int i;
	for(i=0;i<P.n;i++){
		P.tab[i]=malloc(sizeof(int)*P.k);
		if(P.tab[i] == NULL){
			exit(EXIT_FAILURE);
		}
	}
	printf("plateau dimension : %d %d \n", P.n, P.k);
	return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation 1", "14 3",""],
  ["Déclaration et utilisation 2", "47 85",""] ] 
==

astuces==#|python|
[
  { "content": """Un tableau d'entiers génériques à deux dimensions dont on ne connait pas les tailles est de type `int**`."""}
]
==

