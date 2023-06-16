extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Henri Derycke

title=Déplacement d'une liste doublement chainée à une autre

tag=Liste|Pointeur


text==#|markdown|
```c 
typedef struct _maillon {
    int value;
    struct _maillon ∗suiv, ∗prec;
} Maillon , ∗ Liste;

On souhaite écrire une fonction `void move(Liste *source, Liste *cible);` qui déplace le premier
maillon de la liste pointé par source devant le maillon pointé par cible.

Écrire le code de la fonction **move**.
Attention : Vous devrez gérer le cas où source pointe sur un pointeur `NULL` en ne faisant rien.

<code>

    {{code_before}}
</code>
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

code_before==

typedef struct cel{  
    int val;  
    struct cel* suivant;  
} Cellule;  

typedef Cellule* Liste;



==

code_after==

#include <stdlib.h>
#include <stdio.h>

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










