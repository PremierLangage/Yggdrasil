


title=Affiche liste
tag=Liste|Pointeur|Iteration

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `affiche ` qui affiche, sur une seule ligne, les éléments
d'une liste chainée passée en parametre.  <br>
<br>

On utilisera les types:  <br>
<br>

    typedef struct cel{  
        int val;  
        struct cel* suivant;  
    } Cellule;

    typedef Cellule* Liste; 

==

editor.code==
... affiche(...) {
   /* votre code ici... */
}

==
solution==
void affiche(Liste lst){

while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lst->suivant;
    }
printf("\n");

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
	Liste l=NULL;
    lire(&l);
    affiche(l);
	return 0;
}
==


tests==
[ ["Basique", "", "12 10 -4"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", " ".join([str(random.randint(0,100)) for i in range(random.randint(5,20))])+" -1"]
  ]
==









