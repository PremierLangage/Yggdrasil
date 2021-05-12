
#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl


#author=Marc Zipstein
title=Ajout dans un tas dynamique
tag=recherche

editor.height=300px

text==

On représente un tas dynamique avec la structure:  
<code>
    typedef struct {    
        int taille;/* nombre d'éléments présents*/   
        int *arbre;   
        int max;/* nombre maximum d'éléments */   
    }Tas;   
<code>
On alloue BLOC éléments lorsque le tableau est plein et on libère BLOC éléments lorsque 2*BLOC sont vides.
Ceci écite des allocations_désallocations succéssives.
 Ecrire une fonction **ajoute** qui reçoit un Tas et un entier et ajoute l'entier au  tas. La fonction renvoie 1 si l'ajout et réussit. En cas d'échec elle renvoie 0.

==

editor.code==#|c|
int ajoute  (Tas *t,int val){
  int enfant,parent,tmp;

  if(t->taille==t->max){
        int *tmp;
	if((tmp=realloc(t->arbre,(t->max +BLOC)*sizeof(int)))==NULL)
	  return 0;
	else{
	  t->arbre=tmp;
	t->max+=BLOC;
	}
  }
    t->arbre[t->taille]=val;
    t->taille ++;
    enfant=t->taille -1;
    parent=(enfant -1)/2;
    while (enfant>0 && t->arbre[enfant]<t->arbre[parent]){
      tmp= t->arbre[enfant];
      t->arbre[enfant]=t->arbre[parent];
      t->arbre[parent]=tmp;
      enfant=parent;
      parent=(parent-1)/2;
    }
    return 1;
}
==

solution==#|c|
int ajoute  (Tas *t,int val){
  int enfant,parent,tmp;

  if(t->taille==t->max){
        int *tmp;
	if((tmp=realloc(t->arbre,(t->max +BLOC)*sizeof(int)))==NULL)
	  return 0;
	else{
	  t->arbre=tmp;
	t->max+=BLOC;
	}
  }
    t->arbre[t->taille]=val;
    t->taille ++;
    enfant=t->taille -1;
    parent=(enfant -1)/2;
    while (enfant>0 && t->arbre[enfant]<t->arbre[parent]){
      tmp= t->arbre[enfant];
      t->arbre[enfant]=t->arbre[parent];
      t->arbre[parent]=tmp;
      enfant=parent;
      parent=(parent-1)/2;
    }
    return 1;
}
==



code_before==#|c|
#include<stdio.h>
#include<stdlib.h>
#define BLOC 5

typedef struct{
  int taille;
  int *arbre;
  int max;
}Tas;


==

code_after==#|c|

void affiche(Tas t){
  int i;
  printf(" \n");
  if (t.arbre!=NULL){
    printf("%d element%s :",t.taille,t.taille>1?"s":"");
    for(i=0;i<t.taille;i++)
      printf("%d ",t.arbre[i]);
  }
}
int init(Tas *t){
  t->taille=0;
  t->arbre=malloc(BLOC*sizeof(int));
  if(t->arbre!=NULL){
    t->max=BLOC;
    return 1;
  }
  return 0;
}

int main(int argvc,char* argv[]){
    Tas t;
    int x;
    if(init(&t)==0)
        return 1; 
    
    while(1==    scanf("%d",&x)){
        ajoute(&t,x);
        affiche(t);
    }

  return 0;
}
==




checks_args_stdin==#|python|
	[["Arbre feuille","","4"],
	 ["arbre à 3 mots","","12  5 2"],
     ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(10) ])]
]
==


