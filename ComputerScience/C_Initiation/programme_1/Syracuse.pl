
author=

name=Suite de Syracuse
title=Suite de Syracuse
tag=program,while 
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
 Une suite de Syracuse est définie par:<br>
$%u_0%$ et <br>
    $%u_{n+1}=  u_n/2%$ si $%u_n %$ est pair  
   $%u_{n+1}= 3u_n + 1%$ si $%u_n%$ est impair<br>
Pour toute valeur de $%u_0%$ testées, la suite converge vers 1.<br> 
On appelle *temp de vol* le premier entier tel que $%u_n=1%$. <br>
Ecrire un programme qui lit un entier strictement positif $%n%$ et affiche le temps de vol de la suite de Syracuse pour $%u_0=n%$
==

editor.code==
int main(void) {
  /* votre code ici... */
  printf("pour u0=%d temp de vol %d\n",...,...);
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int main(void) {
	int n,u0 ;
    int temp=0;
    scanf("%d",&n);   

    if (n>0){
        u0=n;
        while (n!=1){
            if (n%2==0){
                n=n/2;
                }
            else{
                n=3*n+1;
            }
            temp+=1;
        }
	printf("pour u0=%d temp de vol %d\n",u0,temp);
    
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






