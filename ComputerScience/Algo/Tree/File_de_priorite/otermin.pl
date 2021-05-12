
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
titre=Extraction dans un tas dynamique
tag=recherche

editor.height=300px

text== 
On représente un tas dynamique avec la structure:  
    typedef struct {    
        int taille;/* nombre d'éléments présents*/
        int *arbre;
        int max;/* nombre maximum d'éléments */
    }Tas;
On alloue BLOC éléments lorsque le tableau est plein.  
On libère BLOC élémentslorsque 2*BLOC sont vides.
Ceci évite des allocations_désallocations succéssives (effet d'hystérésis) si l'on a une succession d'ajout et de retraits.   

Ecrire une fonction **otermin** qui reçoit un Tas et un entier et donne à l'entier la valeur du minimum du tas.  
La fonction renvoie 1 si un minimum a été trouvé, 0 sinon;  . Si 2 BLOC sont libres, un BlOc est libéré.


==

editor.code==#|c|

int otermin  (Tas *t,int *min){
    int enfantg,enfantd,parent,temp;
  if(t->taille <=0)
    return 0;
  *min=t->arbre[0];// récupération du min 
  t->arbre[0]=t->arbre[t->taille -1];// placement du plus a droite en haut de l'arbre
  // réalocation si nécessaire 
  if(t->taille==t->max-2*BLOC+1){
    int *tmp;
    if((tmp=realloc(t->arbre,(t->taille+BLOC)*sizeof(int)))==NULL)
	    return 0;
    else{
      t->arbre=tmp;
      t->max-=BLOC;
    }
  }

// on fait rouler le caillou jusqu'a sa place 
  t->taille--;
  parent=0;
  enfantg=1;enfantd=2;
  while(enfantg<t->taille){
    if(enfantd<t->taille && t->arbre[enfantd]< t->arbre[enfantg])
      enfantg=enfantd;
    if  (t->arbre[parent]> t->arbre[enfantg]){
      temp=t->arbre[parent];
      t->arbre[parent]=t->arbre[enfantg];
      t->arbre[enfantg]=temp;
      parent=enfantg;
      enfantg=2*parent+1;enfantd=enfantg+1;// le deux noeud sont l'un a coté de l'autre 
    }
    else
      break; // c'est fait 
  }return 1;
  }                            
==

solution==#|c|

int otermin  (Tas *t,int *min){
    int enfantg,enfantd,parent,temp;
  if(t->taille <=0)
    return 0;
  *min=t->arbre[0];
  t->arbre[0]=t->arbre[t->taille -1];
  if(t->taille==t->max-2*BLOC+1){
    int *tmp;
    if((tmp=realloc(t->arbre,(t->taille+BLOC)*sizeof(int)))==NULL)
	    return 0;
    else{
      t->arbre=tmp;
      t->max-=BLOC;
    }
  }

  t->taille--;
  parent=0;
  enfantg=1;enfantd=2;
  while(enfantg<t->taille){
    if(enfantd<t->taille && t->arbre[enfantd]< t->arbre[enfantg])
      enfantg=enfantd;
    if  (t->arbre[parent]> t->arbre[enfantg]){
      temp=t->arbre[parent];
      t->arbre[parent]=t->arbre[enfantg];
      t->arbre[enfantg]=temp;
      parent=enfantg;
      enfantg=2*parent+1;enfantd=enfantg+1;
    }
    else
      break;
  }return 1;
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
void affiche(Tas t){
  int i;
  printf(" \n taille%d max %d, ",t.taille,t.max );
  if (t.arbre!=NULL){
    printf("%d element%s :",t.taille,t.taille>1?"s":"");
    for(i=0;i<t.taille;i++)
      printf("%d ",t.arbre[i]);
  }
  printf("\n");
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
    
    while(1==    scanf("%d",&x))
        ajoute(&t,x);
    printf("avant ");affiche(t);
    otermin(&t,&x); printf("extrait %d \n",x);
    printf("apres ");affiche(t);  

  return 0;
}
==




checks_args_stdin==#|python|
	[["Arbre feuille","","4"],
	 ["arbre à 3 mots","","12  5 2"],
     ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(11) ])]
]
==



