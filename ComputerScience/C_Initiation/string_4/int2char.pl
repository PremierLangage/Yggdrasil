
# author=DR+ZIP

author=

tag=string|unsignedInt|char|OperationCaractere

title=int vers char

extends=/ComputerScience/C/template/stdsandboxC.pl

text==  
Ecrire une fonction `void uint2char(unsigned int n,char ecrit[])`, qui recoit un entier positif `n`
et remplit le tableau `ecrit` avec l'écriture en chiffre de `n` en respectant les conditions suivantes :   

    si n=94, ecrit contiendra "94"  
    si n=2*2*2*2*2*2*2*2*2*2, ecrit contiendra "1024"
    si n=6*7, ecrit contiendra "Karembeu" 

On rappel qu'un `unsigned int` est un entier compris entre `0` et `4294967295` (soit 2&sup3;&sup2; - 1). On aura donc besoin 
d'un tableau pouvant contenir au max un nombre de 10 chiffres (4294967295)
==

editor.code==
void uint2char(unsigned int n,char ecrit[]) { 
/* A compléter */
}
==

solution==
void uint2char(unsigned int n,char ecrit[]) { 
int indice=9;
char e[11];
if (n==0){
    strcpy(ecrit,"0");
    return;}
if (n==6*7) {
    strcpy(ecrit,"Karembeu");
    return;}
e[10]='\0';
while(n>0){
/*positionnement à partir du caractère '0' dans la table ascii*/
/*et on se décale de n%10 pour y trouver le caractère correspondant*/
    e[indice]='0'+n%10;
    indice-=1;
    n/=10;
    }
strcpy(ecrit,e+indice+1);
}
==

codebefore==
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

==

codeafter==
int main(void) {
	int n;
    char N[11];
    scanf("%u",&n);
    uint2char(n,N);
    printf("%s\n",N);
return 0;
}
==

tests==
[ ["Basique", "", " 10 "],
  ["Nul", "", "0"],
  ["tete","","102212"],
  ["Aléatoire", "", str(random.randint(1000000,42949100))],
  ["Aléatoire", "", str(random.randint(6*7-4,6*7+3))],
  ]
==















