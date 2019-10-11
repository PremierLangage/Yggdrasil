# Copyright 2018 DR
#
# Initialisation d'un tableau d'entier

author=DR
title=Initialisation d'un tableau avec les carrés des entiers
tag=array|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction **init_with_square** qui prend en paramètre un tableau 
ainsi qu'un entier pour sa taille. Votre fonction devra initialiser le contenu 
du tableau en placant les premiers carrés des nombres entiers positifs 
$%1%$, $%4%$, $%9%$, $%16%$ jusqu'à $%n^{2}%$.
    
==

editor.code==
void init_with_square(...) {
  /* votre code ici... */
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

void init_with_square(int* tab, int n){

	if (n<1) return ;


	int i;
	for (i = 0; i < n; i++) {
		tab[i] = (i+1)*(i+1);
	}
	return tab;
}


==


codeafter==


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


tests==
[ ["Basique", "10", ""],
  ["Vide", "0", ""],
  ["Négatif", "-33", ""],
  ["Grand", "100", ""],
  ["Aléatoire", str(random.randint(1, 20)), ""],
  ["Aléatoire", str(random.randint(20, 40)), ""] ]
==

