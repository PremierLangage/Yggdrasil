
title= Ecrire une fonction 
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl



text==  

Vérifions que vous savez écrire une fonction C. 



==

editor.code==
# Votre code 

==




codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==

int est_factoriel( int n){
    int nb=1,f=1;
    while (f<n){
        nb++;
        f*=nb;
    }
	return n==f;
}


==


codeafter==




int main(void) {
	int n ;
scanf("%d",&n);
if (est_factoriel(n)){
	printf("%d  est factoriel\n",n);
    }
else
	printf("%d  n'est pas factoriel\n",n);
return 0;
}
==


tests==
[ ["Basique", "", "10"],
  ["impssible", "", "-1"],
  ["fatoriel", "", "6"],
  ["Aléatoire", "",str(random.randint(1, 20))],
  ["Aléatoire", "", str(random.choice([720, 40,3628800,40320]))] 
  ]
==






