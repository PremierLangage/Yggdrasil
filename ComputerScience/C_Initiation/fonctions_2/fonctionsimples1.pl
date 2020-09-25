author=

title= Ecrire une fonction 
tag=function


extends=/ComputerScience/C/template/stdsandboxC.pl



text==  

Vérifions que vous savez écrire une fonction C. 

Ecrire une fonction **triple** qui retourne le triple de son paramêtre.

==

editor.code==
# Votre code 

==




codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==
int triple( int n){
	return n*3;
}
==


codeafter==
int main(void) {
int n ;
scanf("%d",&n);
printf("%d  est le triple de %d\n",triple(n),n);
return 0;
}
==


tests==
[ ["Basique", "", "10"],
  ["Nul", "", "0"],
  ["Aléatoire", "",str(random.randint(10, 202))],
  ]
==







