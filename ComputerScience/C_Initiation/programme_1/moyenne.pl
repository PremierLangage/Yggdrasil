

title= moyenne d'une suite
tag=AppelFonction|Printf|Scanf|InstructionsConditionnelles|Modulo|
author=

extends=/ComputerScience/C/template/stdsandboxC.pl

text==  

Ecrire un programme qui lit une  suite d'entiers positifs terminée par un négatif puis affiche leur somme et leur moyenne (de type float).<br>
Si la suite commence par un négatif, on indiquera "Suite vide".<br>
<br>
**Exemples :**<br>
-Entrer une suite d'entiers positifs:

1 4

3

3

-1<br>
 somme=11 moyenne=2.750000  <br>
<br>
-Entrer une suite d'entiers positifs:<br>
-1 <br>
Suite vide.<br>
<br>
**Rappel :** le code est sensible aux espaces et autres '\n' qui n'ont pas nécessité d'exister !
==

editor.code==
int main(void) {
...
printf("Entrer une suite d'entiers positifs:\n");
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
    int somme=0;
    int nb=0;
    float moy;
    printf("Entrer une suite d'entiers positifs:\n");
    scanf("%d",&n);
    if(n<0) 
        printf("Suite vide.\n" );
    else{
        while (n>=0){
             somme+=n;
             nb+=1;
             scanf("%d",&n);
           }
        moy=somme;
        moy/=nb;
	    printf("somme=%d moyenne=%f\n",somme,moy);
        }
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", "-1"],
  ["Grand", "", "100 1 2 3 4 5 6 7 8 9 10 -2"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,10))])+" -1"]
  ]
==










