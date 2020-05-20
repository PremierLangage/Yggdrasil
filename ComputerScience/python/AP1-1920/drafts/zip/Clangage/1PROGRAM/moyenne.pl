

title= moyenne d'une suite
tag=boucle,tests


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire un programme qence pSi lasuite commui lit une  suite d'entiers positifs terminée par un négatif puis affiche leur somme et 
leur moyenne.<br>uuuu

**Exemples :**u 
Entrer une suite d'entiers positifs:
uuuuu
1 4

3

3

-1

6 a 4 diviseurs
==

editor.code==
int main(void) {
  /* votre code ici... */
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




