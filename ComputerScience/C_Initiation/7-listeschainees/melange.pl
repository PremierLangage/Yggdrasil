





title= Mélange de deux listes
tag=shuffle
extends=/ComputerScience/C/template/stdsandboxC.pl
author=  

text==  

Écrire une fonction `void melange(Liste* un,Liste* deux,int n)`qui reçoit deux listes et un entier n .
Elle mélange les deux listes en alternants un élément de l'une et un élément de l'autre.  
Si l'entier n vaut 0 le premier élément provient  la  première liste.
Si l'entier n vaut 1 le premier élément provient  la  deuxième liste.  
Après le mélange la première liste contient tous les éléments (mélangés) et la deuxième est vide.
S'il reste des éléments dans une seule des listes, is sont ajoutés sans changement.   
<br>
Exemple : Si  l1=3->5->7->fin et lst=10->8->6->4->2->0->fin , après mélange(&l1,&lst,1) on doit avoir  l1=10->3->8->5->6->7->4->2->0->fin et lst=fin

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
void melange(Liste* un,Liste* deux,int n){
  ...
}
==
solution==

void melange(Liste* un,Liste* deux,int n){
  Liste tmp,precedent;
  if(*un ==NULL) {
    *un=*deux;
    *deux=NULL;
    return;

  }if(*deux==NULL){
      return;
    }
  if(n==1) {
      tmp=*un;
      *un=*deux;
      *deux=tmp;
  }
    precedent=*un;
    while(precedent->suivant !=NULL && *deux!=NULL){
      tmp=precedent->suivant;
      precedent->suivant=*deux;
      precedent=precedent->suivant;;
      *deux=tmp;
    }
    if(*deux!=NULL){
      precedent->suivant=*deux;
    *deux=  NULL;
    }
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

int coupe1(Liste *un,Liste *deux, int n){
Liste index=*un;
n-=1;
while (index!=NULL && n>0){
    index=index->suivant;
    n-=1;
    }
 if(index==NULL)
   return 0;
if(n==0){
    *deux=index->suivant;
    index->suivant=NULL;
    return 1;
    }    
else
return 0;
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
    int n,ld;
    scanf("%d",&n);
    scanf("%d",&ld);
    lire(&d);
    coupe1(&d,&f,ld);
    melange(&d,&f,n);
    printf("premiere %d,coupe %d\n",n,ld);
    printf("premiere apres : ");
    affiche(d);
    printf("deuxieme apres :");
    affiche(f);
	return 0;
}
==


tests==
[ ["Basique", "", "0 2 10 6 -1 -2 -3"],
  ["Vide 1", "", "1 4 1 2 3"],
  ["Vide 2", "", "1 0 1 2 3"],
  ["Aléatoire 1", "", str(random.randint(0,1))+" "+str(random.randint(5,8))+" "+" ".join([str(random.randint(1,100)) for i in range(random.randint(8,20))])],
  ["Aléatoire 2", "", str(random.randint(0,1))+" "+str(random.randint(10,15))+" "+" ".join([str(random.randint(1,100)) for i in range(random.randint(8,20))])]

  ]
==












