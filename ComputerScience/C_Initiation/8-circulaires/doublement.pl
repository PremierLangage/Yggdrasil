






title=extrait dans liste
tag=extrait liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  
On utilise une liste doublement chainée circulaire avec une cellule sans donnée (cellule 'morte' en début de liste,  
Une telle liste est considére vide si elle est réduite à cette cellule si Ecrire une fonction `int est_vide(DListe lst) `, qui renvoie 1 si la DListe est vide,0 sinon.
On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste;  

==

editor.code==

Liste extrait(Liste *lst,int x){
  Liste tmp=NULL,index=*lst;
  if(*lst!=NULL){
    if((*lst)->val==x){
      tmp=*lst;
      (*lst)=(*lst)->suivant;
       tmp->suivant=NULL;
    }
    else{
      while(index->suivant!=NULL &&index->suivant->val!=x)
        index=index->suivant;
      if(index->suivant!=NULL){
        tmp=index->suivant;
        index->suivant=tmp->suivant;
        tmp->suivant=NULL;
      }  
    }
  }
  return tmp;
}
==

solution==
Liste extrait(Liste *lst,int x){
  Liste tmp=NULL,index=*lst;
  if(*lst!=NULL){
    if((*lst)->val==x){
      tmp=*lst;
      (*lst)=(*lst)->suivant;
      tmp->suivant=NULL;
    }
    else{
      while(index->suivant!=NULL &&index->suivant->val!=x)
        index=index->suivant;
      if(index->suivant!=NULL){
        tmp=index->suivant;
        index->suivant=tmp->suivant;
        tmp->suivant=NULL;
      }  
    }
  }
  return tmp;
}
==

codebefore==

#include <stdlib.h>
#include <stdio.h>

typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste  ;

Cellule* alloue_Cellule(int x){
Liste tmp=NULL;
if((tmp=(Liste)malloc(sizeof(Cellule)))!=NULL){
    tmp->val=x;
    tmp->suivant=NULL;
    }
return tmp;
}
void lire(Liste *lst){
    Liste tmp=NULL;
    int x;
    while(scanf("%d",&x)==1){
        if(*lst==NULL){
            *lst=alloue_Cellule(x);
            tmp=*lst;
        }
        else{
            tmp->suivant=alloue_Cellule(x);
            tmp=tmp->suivant;
        }
    }
}


void affiche(Liste lst){

while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lst->suivant;
    }
printf("\n");
}

==

codeafter==
int main(void) {
	Liste l=NULL;
    lire(&l);
extrait(&l,10);
    affiche(l);
	return 0;
}
==


tests==
[ ["Basique", "", "1 -5 10 0 -1"],
  ["Vide", "", ""],
  ["tete","","10 22 12"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20)+10)])]
  ]
==









