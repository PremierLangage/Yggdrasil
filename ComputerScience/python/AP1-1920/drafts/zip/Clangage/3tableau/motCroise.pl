


author=
difficulty=3

title=Mots croisés.
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==  
    Pour représenter un grille de mots croisés on utilise un tableau
     rectangulaire de char de taille LIGNES$%\times%$COLONNES.  
  
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LIGNES 7
#define COLONNES 7 

void affiche(char tab[][COLONNES]){
  int i,j;
  for(i=0;i<LIGNES;i++){
    for(j=0;j<COLONNES;j++)
      if(tab[i][j]==1)
	      printf("1");
      else if (tab[i][j]==0)
	      printf(".");
      else
	      printf("%c",tab[i][j]);
    printf("\n");
      }
}

==

editor.code==
int place_noire(char plateau[][COLONNES],int x,int y){
  if(x<0 || x>=LIGNES||y<0||y>=COLONNES|| plateau[x][y]!=0)
    return 0;
  plateau[x][y]=1;
  return 1;
}

==

solution==
int place_noire(char plateau[][COLONNES],int x,int y){
  if(x<0 || x>=LIGNES||y<0||y>=COLONNES|| plateau[x][y]!=0)
    return 0;
  plateau[x][y]=1;
  return 1;
}

==

codeafter==

int main(void){
int x,y;
char d,mot[10];
char tab[LIGNES][COLONNES]={{'\0'}};
strcpy(tab[1],"OPALINE");
strcpy(tab[3],"SAS1");

scanf("%d",&x);scanf("%d",&y);
if(place_noire(tab,x,y)==1)
  printf("case valide \n");
 else
  printf("case invalide \n"); 
 affiche(tab);
 return 0;
}
==


tests==
[ ["simple éxécution", "","2 2"],
 ]
==


















