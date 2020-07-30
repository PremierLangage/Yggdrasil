




title= coupe d'une liste
tag=Séprer une liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `coupe`qui reçoit deux listes et un entier n strictemment positif.
la deuxième liste est supposé vide.
elle coupe la première après la $% n^{\mbox{ième}} %$cellule et affecte le reste à l deuxième liste. 
Si n est nul ou plus grand ou égal au nombre d'éléments de la liste on renvoie 0 et il ne se  passe rien . 
Sinon on renvoie 1.
On utilisera le$s types:  
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







