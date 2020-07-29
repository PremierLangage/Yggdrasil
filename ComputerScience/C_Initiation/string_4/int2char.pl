






title=int vers char

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `void uint2char(unsigned int n,char ecrit[]) `, qui recoit un entier positif `n`
et remplit le tableau `ecrit` avec l'écriture ascii de `n`   
si n=94 ecrit contient "94"  
==


editor.code==

void uint2char(unsigned int n,char ecrit[]) { 
int indice=9;
char e[11];
if (n==0){
    strcpy(ecrit,"0");
    return;}
e[10]='\0';
while(n>0){
    e[indice]='0'+n%10;
    indice-=1;
  
    n/=10;
    }
strcpy(ecrit,e+indice+1);
}
==

solution==
void uint2char(unsigned int n,char ecrit[]) { 
int indice=9;
char e[11];
if (n==0){
    strcpy(ecrit,"0");
    return;}
e[10]='\0';
while(n>0){
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
    char N[11]={0};
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
  ["Aléatoire", "", str(random.randint(1000000,42949100))]
  ]
==









