title= Diviseurs d'un entier
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  
 
Ecrire une fonction qui reçoit un  entier  strictement positif et affiche,
 **un par ligne**, chacun de ses diviseurs en ordre croissant.
La fonction renvoie le nombre de diviseurs.

Si l'entier est négatif ou nul, la fonction retourne -1.

**Exemple :**

Un nombre : 6

1

2

3

6

6 a 4 diviseurs
==

editor.code==
/*type retour*/ divise(/*paramètre(s)*/) {
  /* votre code ici... */
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int divise(int n){
  if(n <= 0){
    return -1;
  }
  int nb=0,div;
	
	for (div = 1; div <= n; div++) {
		if (n%div == 0){
      printf("%d\n", div);
      nb++;
    }
	}
	return nb;
}


==


codeafter==




int main(int argc, char const *argv[]) {
	int n = atoi(argv[1]);
  int nb=0;   
	nb=divise(n);
  /*if (n>0)*/
		printf("%d a %d diviseurs\n",n,nb);
	return 0;
}
==


tests==
[ 
  ["Exemple énoncé", "6", ""],
  ["Basique", "10", ""],
  ["Vide", "0", ""],
  ["Grand", "100", ""],
  ["Négatif", "-1", ""],
  ["Nul", "0", ""],
  ["Aléatoire", str(random.randint(1, 20)), ""],
  ["Aléatoire", str(random.randint(20, 40)), ""] ]
==




