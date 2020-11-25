



title= Ajout dans une liste triée
tag=ajout d'une liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `void ajout_trieListe(*lst,int x) `
qui ajoute un élément x à une liste chainée triée (ordre  croissant) 
passée en parametre.  
La liste devra rester trie


<br>

On utilisera les types: <br>
<br>

    typedef struct cel{  
        int val;   
        struct cel* suivant;  
    } Cellule;  

    typedef Cellule* Liste;  


ainsi que la fonction `alloue_Cellule` précedemment écrite.
==

editor.code==

void ajout_trie(Liste *lst,int x){
...
}

==
solution==
void ajout_trie(Liste *lst,int x){
Liste tmp=NULL, index=*lst;
if(*lst==NULL){
    *lst=alloue_Cellule(x);
    return;
    }
if(x<(*lst)->val){
    tmp=alloue_Cellule(x);
    tmp->suivant=(*lst);
    *lst=tmp;
    return;
    }
index=*lst;
while(index->suivant!=NULL && index->suivant->val<x)
    index=index->suivant;
tmp=alloue_Cellule(x);
tmp->suivant=index->suivant;
index->suivant=tmp;
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
    
    }
return tmp;
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


int main(void) {
	Liste l=NULL;
    int x;
    while(scanf("%d",&x)==1)
        ajout_trie(&l,x);
    affiche(l);
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,30))])+" -1"]
  ]
==










