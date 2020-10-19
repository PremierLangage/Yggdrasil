
author= 
title=Combat
tag=struct
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Chaque piece d'un jeu de plateau est caractérié par:  
 -sa couleur    
 -sa force  
 -son agilité  
 -ses points de vie.    
 Lorsque deux pieces de couleur différentes se rencontrent,
 un combat a lieu. Chaque joueur lance un dé et on compare les sommes (valeur du dé +force +agileté).
  La plus haute somme détermine le vainqueur et la différence des sommes est soustraite aux points de vie du vaincu. En cas d'ex-aequo, il ne se passe rien pour ce tour. Le tirage se répète jusqu'à  ce qu'un des joueurs ait un nombre de points de vie négatif ou nul.  
Ecrire une fonction `combat` qui reçoit deux pièces et réalise le combat suivant ces règles et change le nombre de points de vie de chaque piece.
La fonction  renvoie 1 si un combat a eu lieu ( couleurs différentes) et 0 sinon.  .
Le lancé de dé est simulé par la fonction `lance_de(.)` supposée déjà écrite.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 50

int lance_de(void){
 int d= rand()%6+1;
 return d;
}
==

editor.code==
typedef struct{
	char couleur[MAX];
	int force;
	int agilite;
	int pdv;
	}Joueur;

int combat(...){
}


==
solution==
typedef struct{
	char couleur[MAX];
	int force;
	int agilite;
	int pdv;
	}Joueur;

int combat(Joueur *un,Joueur *deu){
int somun,somdeu;
if (strcmp(un->couleur,deu->couleur)!=0){
   while(un->pdv>0&&deu->pdv>0){
	somun=un->force+un->agilite+lance_de();
	somdeu=deu->force+deu->agilite+lance_de();
	if(somun>somdeu)
		deu->pdv-=somun-somdeu;
	else
		un->pdv-=somdeu-somun;
	}
   return 1;
}
 else
   return 0;
}

==
codeafter==



int main(void){
  Joueur t[5]={
  {"bleu",8,4,40},
  {"bleu",10,9,22},
  {"rouge",10,10,20},
  {"vert",12,14,5},
  {"rouge",10,10,20} };
  int x; 
    
  Joueur a;
  Joueur b;
 unsigned int seed;
 
 scanf("%d",&seed); srand(seed);
 scanf("%d",&x);
 a=t[x];
 scanf("%d",&x);
 b=t[x];
 if (combat(&a,&b)){
 if (a.pdv >0)
   printf("%s bat %s reste %d pdv\n",a.couleur,b.couleur,a.pdv);
 else
     printf("%s bat %s reste %d pdv\n",b.couleur,a.couleur,b.pdv);
 }
 else
   printf("meme couleur\n");
 return 0;
 }

==


tests==
[ 
["aléatoire ", "",str(random.randint(1000,2008))+" "+str(random.randint(0,4))+" "+str(random.randint(0,4))],

["aléatoire ", "",str(random.randint(1000,2008))+" "+str(random.randint(0,4))+" "+str(random.randint(0,4))],
["aléatoire ", "",str(random.randint(1000,2008))+" "+str(random.randint(0,4))+" "+str(random.randint(0,4))],
]
==





