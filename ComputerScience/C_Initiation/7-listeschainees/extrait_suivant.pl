




title=Extrait dans liste
tag=listes|pointeurs|iteration

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 
text==  

Écrire une fonction `Cellule* extrait_suivant(Liste l, int precede)`, qui extrait,
si elle existe, la cellule située après celle contenant `precede`. La fonction renvoie
l'adresse de la cellule extraite ou `NULL` si elle n'existe pas. <br><br>
Exemple : <br>
- Si la liste `l` contenait 3->1->2->4->fin et precede=1, l'appel `extrait_suivant(l,precede)` renvoyera une cellule contenant 2, et la liste `l` après éxécution contiendra `3->1->4->fin`. <br>

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

  if(lst!=NULL)
  {
    while(lst->suivant!=NULL &&lst->suivant->val!=x)
        lst=lst->suivant;

    if(lst->suivant!=NULL)
    {
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
int pos=0,taille=0,i;
scanf("%d",&pos);
Liste l=NULL,lpos;
 taille=lire(&l);
    lpos=l;
/* extracts the entry after position pos */
if(pos< taille-1){
    for(i=0;i<pos;i+=1)
        lpos=lpos->suivant;
    extrait_suivant(l,lpos->val);
    }

else
    extrait_suivant(l,pos);
affiche(l);
return 0;
}
==


tests==
[ ["Basique", "", "2 10 0 -2 5"],
  ["Vide", "", ""],
  
  ["Aléatoire 1", "",str(random.randint(3,10))+" " +" ".join([str(random.randint(0,100)) for i in range(random.randint(5,20)+10)])],
    ["Aléatoire 2", "",str(random.randint(5,40))+" " +" ".join([str(random.randint(0,100)) for i in range(random.randint(50,70)+10)])]

  ]
==










