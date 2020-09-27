#*****************************************************************************
#  Copyright (C) 2018 Dominique Revuz
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Dominique Revuz

title=Initialisation d'un tableau avec les carrés des entiers
tag=array|function|tableau

text==

Écrire une fonction **init_with_square** qui prend en paramètre un tableau d'entiers
ainsi qu'un entier pour sa taille. Votre fonction devra initialiser le contenu 
du tableau en placant les premiers carrés des nombres entiers positifs 
$%1%$, $%4%$, $%9%$, $%16%$ et ainsi de suite...   

<br />
==

editor.code==
void init_with_square(...) {
  /* votre code ici... */
}
==

code_before==#|c|
#include <stdlib.h>
#include <stdio.h>
==

solution==#|c|
void init_with_square(int* tab, int n){

	if (n<1) return ;


	int i;
	for (i = 0; i < n; i++) {
		tab[i] = (i+1)*(i+1);
	}
	return tab;
}
==

code_after==#|c|
void printTableau(int *tab, int n) {
	int i;
	for (i = 0; i < n; i++) {
		printf("%d ", tab[i]);
	}
	printf("\n");
}

int main(int argc, char const *argv[]) {
	int n = atoi(argv[1]);
 	int *tab  = malloc(sizeof(int)*n);
	init_with_square(tab, n);
	if (n > 0)
		printTableau(tab, n);
	else
		printf("tableau NULL");
	return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["10"], ""],
  ["Tableau vide", ["0"], ""],
  ["Taille Négative", ["-33"], ""],
  ["Grand tableau", ["100"], ""],
  ["Test aléatoire 1", [str(randint(1, 20))], ""],
  ["Test aléatoire 2", [str(randint(20, 40))], ""],
  ["Test aléatoire 3", [str(randint(40, 80))], ""] ]
==


