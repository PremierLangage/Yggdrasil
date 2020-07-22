


title= affiche liste
tag=affichage d'une liste simplement chainée

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `affiche `
qui affiche, sur une ligne, les éléments d'une liste chainée passée en parametre.  
On utilisera les types:  
typedef struct cel{
int val;
struct cel* suivant;
}Cellule;
typedef Cellulle* Liste  

==

editor.code==
....affiche(...) {
...
  /* votre code ici... */
}

==
solution==
void affiche(Liste lst){

while(lst !=NULL){
    printf("%d ",lst->val);
    lst=lt->suivant;
    }
printf("\n");

}

==

codebefore==

#include <stdlib.h>
#include <stdio.h>

==

codeafter==
 Cellule* alloue_Cellule(int x){
if((tmp=(Liste)malloc(sizeof(Cellule))!=NULL){
    tmp->val=x;
    tmp->suivant=NULL;
    }
return tmp;
}
void lire(Liste *lst){
    Liste tmp=NULL;
    while(scanf("%d",&x)==1)){
        if(*lst==NULL){
            *l=alloue_Cellule(x);
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
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", "-1"],
  ["Grand", "", "100 1 2 3 4 5 6 7 8 9 10 -2"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,10))])+" -1"]
  ]
==





