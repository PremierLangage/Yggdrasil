




title=extrait dans liste
tag=extrait liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `Cellulu * extraitsuivant(int precede)l `, qui extrait, si elle existe la cellule situé après 
celle contenant precede.La fonction renvoie l'adresse de la cellule extraite ou NULL.

On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste;  

==

editor.code==
Cellule* extrait_suivant(...) {
...
  /* votre code ici... */
}

==
solution==
Liste extrait_suivant(Liste lst,int x){
  Liste tmp=NULL;

  if(lst!=NULL){
    while(lst->suivant!=NULL &&lst->suivant->val!=x)
        lst=lst->suivant;
    if(lst->suivant!=NULL){
        tmp=lst->suivant;
        lst->suivant=tmp->suivant;
        tmp->suivant=NULL;
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



==

codeafter==

void affiche(Liste lst){

while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lst->suivant;
    }
printf("\n");

}

int main(void) {

	Liste l=NULL;
    lire(&l);

    affiche(l);
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20)+10)])]
  ]
==







