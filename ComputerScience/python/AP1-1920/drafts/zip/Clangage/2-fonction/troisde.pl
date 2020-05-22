
title= lancé de dés
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  
 
Ecrire une fonction 'lance_de' qui reçoit un  entier n et renvoie
 le nombre de façon d'obtenir n avec 3 dés

**Exemple :**

lance_de(4) renvoie  3
 
 lance_de(2) renvoie 0
==

editor.code==
... lance_de(...) {
  /* votre code ici... */
}
==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int lance_de( int n){
    int nb=0;
    int i,j,k;
    for (i=1;i<=6;i++){
        for(j=1;j<=6;j++)
            for(k=1;k<=6;k++)
                if(i+j+k==n)
                    nb++;
    }                
	return nb;
}


==


codeafter==

int main(int argc, char const *argv[]) {
	int n = atoi(argv[1]);
int nb=0;   
	nb=lance_de(n);
  
		printf("%d façons d'obtenir %d \n",nb,n);
	return 0;
}
==


tests==
[ ["Basique", "5", ""],
  ["Vide", "0", ""],
  ["Grand", "10", ""],
  ["Aléatoire", str(random.randint(1, 20)), ""],
  ["Aléatoire", str(random.randint(20, 40)), ""] ]
==


