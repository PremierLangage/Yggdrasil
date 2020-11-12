




title=extrait dans liste
tag=extrait liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 
text==  

Ecrire une fonction `Cellule* extrait_suivant(Liste l, int precede)`, qui extrait,
si elle existe la cellule située après celle contenant `precede`. La fonction renvoie
l'adresse de la cellule extraite ou `NULL`. <br>
<br>

On utilisera les types: <br>
<br>

    typedef struct cel{  
        int val;   
        struct cel* suivant;  
    } Cellule;  

    typedef Cellule* Liste;  

==

editor.code==
Cellule* extrait_suivant(Liste l, int precede) {
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

int lire(Liste *lst){
    Liste tmp=NULL;
    int x;
    int nb=0;
    while(scanf("%d",&x)==1){
        if(*lst==NULL){
            *lst=alloue_Cellule(x);
            tmp=*lst;
            }
        else{
            tmp->suivant=alloue_Cellule(x);
            tmp=tmp->suivant;
            }
         nb+=1;
   }

return nb;
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
int preced=0,nb=0,i;
scanf("%d",&preced);
Liste l=NULL,d;
 nb=lire(&l);
    d=l;
if(preced< nb-1){
    for(i=0;i<preced;i+=1)
        d=d->suivant;
    extrait_suivant(l,d->val);
    }

else
    extrait_suivant(l,preced);
affiche(l);
return 0;
}
==


tests==
[ ["Basique", "", "2 10 0 -2 5"],
  ["Vide", "", ""],
  
  ["Aléatoire", "",str(random.randint(3,10))+" " +" ".join([str(random.randint(0,100)) for i in range(random.randint(5,20)+10)])]
  ]
==









