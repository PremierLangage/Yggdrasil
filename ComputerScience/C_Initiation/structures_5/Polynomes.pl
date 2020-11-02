

# Déclaration d'une structure C pour un plateau

author=  
title=Structure C pour un polynome 
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarer et définir un type de *structure* C nommé *Monomes* contenant deux champs entiers: un champs *coef* et un champs *degre*
Déclarer et définir un type de *structure* C nommé *Polynome*. Cette structure
devra contenir deux champs : un tableau de  monomes, de taille *MAX*, nommé *termes*, 
un entier *taille* indiquant le nombre de momomes.

==

editor.code==

typedef struct {
    int coef;
    int degre;
}Monome;

typedef struct{
    Monome termes[MAX];
    int taille;
}Polynome;


==
codebefore==
#define MAX 50
==
solution==

typedef struct {
    int coef;
    int degre;
}Monome;

typedef struct{
    Monome termes[MAX];
    int taille;
}Polynome;

==

codeafter==

#include <stdio.h>
#include <stdlib.h>


int main(void){
	Polynome p;
    Monome m;

	p.taille = 22;
	m.degre = 4;
    m.coef = 5;
	p.termes[0] = m;
    p.termes[1] = p.termes[0];
	return 0;
}

==

tests==
[ ["Déclaration et utilisation 1", "",""],
 ] 
==




