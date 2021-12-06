title= Nombre de cellules d'une liste
tag=Liste|Pointeur|Iteration|ParcoursListe

extends=/ComputerScience/C/template/stdsandboxC.pl



text==  

Ecrire une fonction `nb_cellules`
qui renvoie le nombre d'éléments d'une liste chainée passée en parametre.  <br>
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
... nb_cellules(...) {
   /* votre code ici... */
}

==
solution==
int nb_cellules(Liste lst){
int compte=0;
while(lst !=NULL){
    compte+=1;
    lst=lst->suivant;
    }
return compte;
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
    int lg;
    lire(&l);
    lg=nb_cellules(l);
    printf("la liste contient %d element%s\n",lg,lg<2?"":"s");
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
    ["Aléatoire 1", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20))])+" -1"],

  ["Aléatoire 2", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,100))])+" -1"]
  ]
==










