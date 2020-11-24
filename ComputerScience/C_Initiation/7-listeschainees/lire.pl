



title= lecture liste
tag=Liste|Pointeur|DeclarationFonction|TransmissionAdresse

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Écrire une fonction `lire` qui lit les éléments successifs d'une liste chainée donnée en entrée au clavier.
La liste à remplir est passée en paramètre et supposée `NULL` à l'appel. La saisie s'arrête
lorsque l'utilisateur n'entre rien avant le ``return``.<br>
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
void lire(...) {
    /* votre code ici... */
}

==
solution==
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
[ ["Basique", "", "10 0 -1 3 21"],
  ["Vide", "", ""],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20)+10)])]
  ]
==











