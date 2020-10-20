



author=
difficulty=3

title=Mots croisés.
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==  
    Pour représenter un grille de mots croisés on utilise un tableau
     rectangulaire de char de taille LIGNES$%\times%$COLONNES.  
Dans une grille les mots sont écrits en majuscules, soit horizontalement de gauc
he à droite, soit verticalement de haut en bas.  
On mémorise :  
   une case vide par 0;  
   une case noire par 1; 
   une case remplie par la lettre majuscule alphabétique contenue.  
  Ecrire une fonction `int place_noire(char plateau[][COLONNES],int x,int y)` qu
i place une case noire sur la case de coordonnées(x,y) de la grille.  
      La fonction renvoie 1 si les coordonnées sont correctes et que la case éta
it vide, 0 sinon.    

 Ecrire une fonction `int place_mot(char plateau[][COLONNES],int x,int y,char m[
], char direction)}`qui place,si possible, le mot aux coordonnées indiquées.  
 Si direction vaut 'h', le mot doit être placé horizontalement, si  direction va
ut 'v', le mot doit être placé  verticalement.  
  Un mot  ne peut être placé que si:    
		toutes les coordonées sont valides  
		les cases étaient vides ou contenaient des lettres 
                qui correspondent à celle du mot.

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
/* A compléter */
}

int place_mot(char plateau[][COLONNES],int x,int y,char m[],char dest){
/* A compléter */
}

==

solution==
int place_noire(char plateau[][COLONNES],int x,int y){
  if(x<0 || x>=LIGNES||y<0||y>=COLONNES|| plateau[x][y]!=0)
    return 0;
  plateau[x][y]=1;
  return 1;
}

int place_mot(char plateau[][COLONNES],int x,int y,char m[],char dest){
  int i,l;
  /*verif*/
  l=strlen(m);
  if (dest=='h'){
    for(i=0;i<l;i++)
      
      if(x<0 || x>=LIGNES||y+i<0||y+i>=COLONNES|| plateau[x+i][y]==1||(plateau[x][y+i]!=0 && plateau[x][y+i]!=m[i] ))
	return 0;
     for(i=0;i<l;i++)
       plateau[x][y+i]=m[i];
     return 1;
  }
   if (dest=='v'){
    for(i=0;i<l;i++)
      
      if(x+i<0 || x+i>=LIGNES||y<0||y>=COLONNES|| plateau[x+i][y]==1||(plateau[x+i][y]!=0 && plateau[x+i][y]!=m[i] ))
	      return 0;
     for(i=0;i<l;i++)
       plateau[x+i][y]=m[i];
    return 1;
   }
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
  scanf("%s",mot);
 scanf("%d %d",&x,&y);
 scanf(" %c",&d);
 if(place_mot(tab,x,y,mot,d))
   printf("mot valide \n");
 else
   printf("mot invalide \n"); 
 affiche(tab);
 return 0;
}
/*
PARADIS
OPALINE
IP1USSR
SAS1SAG
STALINE
O1ASPEN
NORDEST

Perec*/
==


tests==
[ ["simple exécution"," ","2 2 PARADIS 0 0 h"],
 ["mot correct","","1 1"+ random.choice([" POISSON 0 0 v"," DISSIPE 0 4 v"])],
 ["aléatoire","","3 2" + random.choice([" POISSONE 0 0 v" ," DIS 0 4 v"," USSR 2 3 h"," SORT 6 0 v"])],
]
==



