


author=
difficulty=3

title=Mots croisés.
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
  
    Pour représenter un grille de mots croisés on utilise un tableau
     rectangulaire de char de taille LIGNES$%\times%$COLONNES.  
  Dans une grille les mots sont écrits en majuscules, soit horizontalement de gauche à droite, soit verticalement de haut en bas.\\
  On mémorise :  
   une case vide par '0';  
   une case noire par '1';  
   une case remplie par la lettre majuscule alphabétique contenue.  
  Ecrire une fonction `int place\_noire(char plateau[][COLONNES],int x,int y)` qui place une case noire sur la case situé sur la  {\tt x}$^{\mbox{ ième}}$ ligne et la {\tt y}$^{\mbox{ ième}}$ colonne.\\
      La fonction renvoie $1$ si les coordonnées sont correctes et que la case était vide,0 sinon.  

 Ecrire une fonction `int place\_mot(char plateau[][COLONNES],int x,int y,char m[], char direction)}qui place,si possible, le mot aux coordonnées indiquées. Si {\tt direction} vaut{\tt 'h'} , le mot doit \^etre placé horizontalement, si {\tt direction} vaut {\tt 'v'}, le mot doit \^etre placé  verticalement.
  Un mot  ne peut être placé que si:  
			    toutes les coordonées sont valides
			    les cases étaient vides ou contenaientt des lettres 
                qui correspondent à celle du mot


==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

==

editor.code==

==

solution==


==

codeafter==

int main(void){
int x,y;
char mot[10];
  char tab[LIGNES][COLONNES]={{'\0}};
strcpy(t[1],"OPALINE");
strcpy(tab[3,],"SAS1");
scanf("%d %d",&x,&y);
}
/*
PARADIS
OPALINE
IP1USSR
SAS1SAG
STALINE
O1ASPEN
NORDEST

Perec ==


tests==
[ ["simple éxécution", "","toto 10 "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" "+str(random.randint(15,32))],
 
 ["aleatoire","",random.choice(["elle","kayak","velo","radar","avion","rotor","serres","solos","suffit"])+" 10"], ]
==















