





title= mélange de deux listes
tag=shuffle
extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `coupe`qui reçoit deux listes et un entier n .
Elle mélange les deux listes en alternants un élément de l'une et un élément de l'autre.  
Si l'entier n vaut 0 le premier élément provient  la  première liste,
Si l'entier n vaut 1 le premier élément provient  la  deuxième liste.  
S'il reste des éléments dans une seule des listes, is sont ajoutés sans changement.   
Exemple  
l1=(3,5,7)  
lst=(10,8,6,4,2,0)
après mélange(&l1,&lst,1) on doit avoir 
 l1=(10,3,8,5,6,7,4,2,0) et lst=()  
   On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;   
}Cellule;  
typedef Cellule* Liste  

==

editor.code==
int coupe(Liste *un,Liste *deux, int n){
Liste index=*un;
n-=1;
while (index!=NULL && n>0){
    index=index->suivant;
    n-=1;
    }
if(n==0){
    *deux=index->suivant;
    index->suivant=NULL;
    return 1;
    }    
else
return 0;
}

 
==
solution==
int coupe(Liste *un,Liste *deux, int n){
Liste index=*un;
n-=1;
while (index!=NULL && n>0){
    index=index->suivant;
    n-=1;
    }
if(n==0){
    *deux=index->suivant;
    index->suivant=NULL;
    return 1;
    }    
else
return 0;
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

void affiche(Liste lst){
while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lst->suivant;
    }
printf("\n");
}
==

codeafter==
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


int main(void) {
	Liste d=NULL,f=NULL;
    int n;
    scanf("%d",&n);
    lire(&d);
    coupe(&d,&f,n);
    printf("d");
    affiche(d);
    printf("f");
    affiche(f);
	return 0;
}
==


tests==
[ ["Basique", "", "2 10 0 -1"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", str(random.randint(5,8))+" "+" ".join([str(random.randint(1,100)) for i in range(random.randint(8,20))])+" -1"]
  ]
==







