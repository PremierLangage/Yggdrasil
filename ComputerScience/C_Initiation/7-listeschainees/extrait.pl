





title=extrait dans liste
tag=extrait liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `Cellule * extrait(Liste *liste,int x) `, qui extrait, si elle existe, 
la cellule contenant `x`. La fonction renvoie l'adresse de la cellule extraite ou NULL. 
S'il y en a plusieurs cellules contenant la valeur `x`, nous considérerons seulement la première.  <br><br>

On utilisera les types: <br>
<br>

    typedef struct cel{  
        int val;   
        struct cel* suivant;  
    } Cellule;  

    typedef Cellule* Liste;  


==

editor.code==

Liste extrait(Liste *lst,int x){
 ...
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
    int v;
    scanf("%d",&v);
    lire(&l);
    Liste ex = extrait(&l,v);
    affiche(l);
    if (ex != NULL)
        printf("%d\n",ex->val);
    return 0;
}
==


tests==
[ ["Basique", "", "0 1 -5 10 0 -1"],
  ["Vide", "", ""],
  ["tete","","10 10 22 12"],
  ["Aléatoire 1", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20)+10)])],
    ["Aléatoire 2", "", " ".join([str(random.randint(-0,10)) for i in range(random.randint(10,30)+20)])],
    ["Aléatoire 3", "", " ".join([str(random.randint(-0,500)) for i in range(random.randint(5,10))])]

  ]
==










