title= Diviseurs d'un entier
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire un programme qui lit un  entier  strictement positif et affiche,
 **un par ligne**, chacun de ses diviseurs en ordre croissant.
Le programme affiche ensuite le nombre de diviseurs.

Si l'entier est négatif ou nul, on ne fait rien !

**Exemple :**

Un nombre : 6

1

2

3

6

6 a 4 diviseurs
==

editor.code==
... divise(...) {
  /* votre code ici... */
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int divise( int n){
    int nb=2,div;
	
	for (div = 2; div < n; div++) {
		if (n%div ==0)
            nb++;
	}
	return nb;
}


==


codeafter==




int main(int argc, char const *argv[]) {
	int n = atoi(argv[1]);
int nb=0;   
	nb=divise(n);
    if (n==0)
        printf("0 a une infinité de diviseurs\n");
    else
		printf("%d a %d diviseurs\n",n,nb);
	return 0;
}
==


tests==
[ ["Basique", "10", ""],
  ["Vide", "0", ""],
  ["Grand", "100", ""],
  ["Aléatoire", str(random.randint(1, 20)), ""],
  ["Aléatoire", str(random.randint(20, 40)), ""] ]
==


