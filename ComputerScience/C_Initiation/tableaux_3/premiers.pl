
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

#define N 5
/*déclaration du prototype de la fonction pgcd utilisée par la suite*/
int pgcd(int,int);
==

solution==
    
void premiers_entre_eux(int t[][N]){
    int i,j;
    t[0][0]=-1;
    for(i=1;i<N;i++)
        t[0][i]= t[i][0]=0;
    for(i=1;i<N;i++)
        for(j=i;j<N;j++)
            if(pgcd(i,j)==1)
                t[i][j]=t[j][i]=1;
            else
                t[i][j]=t[j][i]=0;
    /*t[0][1]=t[1][0]=1;*/
}
==

codeafter==

int pgcd(int a,int b){
    int r;
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

void affiche(int t[][N]){
int i,j;
for(i=0;i<N;i++){
    for(j=0;j<N;j++)
        printf("%d ",t[i][j]);
    printf("\n");
    }
}

int main(void) {
	int t[N][N] ;
    premiers_entre_eux(t);
    affiche(t);
    return 0;
}
==

tests==
[ ["Basique", "", ""],
  
  ]
==















