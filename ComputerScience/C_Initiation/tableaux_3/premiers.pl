
title= Nombres  premiers entre eux

tag=Fonction|DeclarationFonction|Boucle|RetourFonction

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 
fixme= Il faudrait test le temps de calcul ... 


text==  
 
Ecrire une fonction `premiers_entre_eux` qui reçoit un  tableau carré N$%\times%$N (N est une constante)  
 La fonction remplit la case [i][j] du tableau avec:  
-1 ssi $%i=j=0%$  
1  ssi $% pgcd(i,j)=1%$  
0 sinon

==

editor.code==
/*Votre code*/

==




codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==
int pgcd(int a,int b){
if(b==0)
return a;
r=a%b;

while(r!=0){
    r=a%b;  
    if(r!=0){
      a=b;
        b=r ;
    }
 }
    return b;
}
    
}
int premiers_entre_eux(int t[][N]){
    int i,j;

   t[0][0]=-1;
    for (i=1;i<N;i++)
        t[0][i]= t[i][0]=0;
    for(i=1;i<N;i++)
for(j=i +1;j<N;j++)
    if(pgcd(i,j)==1)
            t[i][j]=t[j][i]=1;
    else
        t[i][j]=t[j][i]=0;
t[0][1]=t[1][0]=1;

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
  ["impossible", "", "-1"],
  ["fatoriel", "", "6"],
  ["Aléatoire", "",str(random.randint(1, 20))],
  ["Aléatoire", "", str(random.choice([720, 40,3628800,40320]))] 
  ]
==













