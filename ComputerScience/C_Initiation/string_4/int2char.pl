

# author=DR+ZIP

author=

tag=string

title=int vers char

extends=/ComputerScience/C/template/stdsandboxC.pl

text==  
Ecrire une fonction `void uint2char(unsigned int n,char ecrit[])`, qui recoit un entier positif `n`
et remplit le tableau `ecrit` avec l'écriture en chiffre arabes de `n`:   

    si n=94, ecrit contiendra "94"  
    si n=2*2*2*2*2*2*2*2*2*2, ecrit contiendra "1024"
    si n=6*7, ecrit contiendra "Karembeu" 
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













