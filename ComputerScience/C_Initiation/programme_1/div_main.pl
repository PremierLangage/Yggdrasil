
title= Diviseurs d'un entier
tag=boucle,tests

author=

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire un programme qui lit un  entier strictement positif et affiche,
 **un par ligne**, chacun de ses diviseurs en ordre croissant.
Le programme affiche ensuite le nombre de diviseurs.

Si l'entier est négatif, on ne fait rien !

0 a une infinité de diviseurs.

**Exemple :**

Un nombre : 6

1

2

3

6

6 a 4 diviseurs

**Rappel :** le code est sensible aux espaces qui n'ont pas nécessité d'exister !
==

editor.code==
int main(void) {
  /* votre code ici... */
return 0;
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==




int main(void) {
	int n ;
    int d;
    scanf("%d",&n);
    int nb=0;   

    if (n==0)
        printf("0 a une infinité de diviseurs\n");
    else {
        for(d=1;d<=n;d+=1){
            if (n%d==0){
                nb+=1;
                printf("%d\n",d);
                }
        }
	    printf("%d a %d diviseurs\n",n,nb);
        }
	return 0;
}
==


tests==
[ ["Basique", "", "10"],
  ["Vide", "", "0"],
  ["Grand", "", "100"],
  ["Aléatoire", "", str(random.randint(1, 20))],
  ["Aléatoire", "", str(random.randint(20, 40))] ]
==







