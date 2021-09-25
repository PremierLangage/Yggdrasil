#*****************************************************************************
#  Copyright (C) 2020 Marc Zipstein
#  Copyright (C) 2020 Olivier Champalle
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Nombres premiers entre eux

tag=tableau|fonction|matrice|dimension|double

author=Prog C L2 Team

text==#|markdown| 
Écrire une fonction `premiers_entre_eux` qui reçoit un tableau carré `N x N` 
(`N` est une constante que vous n'avez pas à définir). Votre fonction derva remplir 
chaque case `[i][j]` du tableau avec :   

$% \left\\{ \\begin{array}{ccc}
-1 & si & i = j = 0 \\newline
1 & si & pgcd(i, j) = 1 \\newline
0 & sinon & \\newline
\\end{array}
\\right.
%$

<br>
Vous n'avez pas à écrire la fonction `pgcd` (normalement vue en TD, cette dernière vous
êtes offerte). Vous devez juste l'utiliser. pour rappel voici son prototype : <br>
`int pgcd(int a, int b)`<br>
la fonction `pgcd` renvoie le plus grand diviseur commun du couple d'entiers `(a, b)`.
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
    t[0][1]=t[1][0]=1;
}

/* OCE autre solution qui marche mais peut être moins optimisée ? */
/* OCE j'ose pas toucher à l'autre solution c'est peut être Marc*/
/* qui suis-je face à Marc ??? */
/* Nan ne dites rien !! */

/* void premiers_entre_eux(int t[][N]){ */
/*    */
/*    int i,j;   */
/*    for(i=0;i<N;i+=1){  */
/*        for(j=0;j<N;j+=1){  */
/*            if(pgcd(i,j)==1)   */
/*                t[i][j]=1;   */
/*            else  */
/*                t[i][j]=0; */
/*        } */
/*    } */
/*    t[0][0]=-1; */
/*} */
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
