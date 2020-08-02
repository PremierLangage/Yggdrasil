






title= liste doublement chainée circulaire
tag= liste vide
author=  
extends=/ComputerScience/C/template/stdsandboxC.pl


text==  
On utilise une liste doublement chainée circulaire avec une cellule sans donnée (cellule 'morte' en début de liste,  
Une telle liste est considére vide si elle est réduite à cette cellule.  
 Ecrire une fonction `int nb_elements(DListe lst) `, qui renvoie le nombre d'éléments effectifs de la liste.
On utilisera les types:  
typedef struct dcel{  
int val;  
struct cel* suivant,*precedant;  
}DCellule;  
typedef DCellule* DListe;  

==

editor.code==
int nb_elements(DListe lst){
  DListe tete=lst;
  int n=0;
  if (est_vide(lst))
    return 0;
  while (lst->suivant!=tete){
    n+=1;
    lst=lst->suivant;
  }
  return n;
}
==

solution==
int nb_elements(DListe lst){
  DListe tete=lst;
  int n=0;
  if (est_vide(lst))
    return 0;
  while (lst->suivant!=tete){
    n+=1;
    lst=lst->suivant;
  }
  return n;
}
==

codebefore==

#include <stdlib.h>
#include <stdio.h>

typedef struct dcel{  
int val;  
struct dcel* suivant,*precedant;  
}DCellule;  
typedef DCellule* DListe  ;

DCellule* alloue_DCellule(int x){
DListe tmp=NULL;
if((tmp=(DListe)malloc(sizeof(DCellule)))!=NULL){
    tmp->val=x;
    tmp->suivant=tmp->precedant=tmp;
    }
return tmp;
}
int est_vide(DListe lst) {

return lst==lst->suivant;
}
void lire(DListe lst){
    DListe tmp=NULL;
    int x;
    while(scanf("%d",&x)==1){  
        tmp=alloue_DCellule(x);
        tmp->suivant=lst->suivant;
        tmp->suivant->precedant=tmp;
        tmp->precedant=lst;
        lst->suivant=tmp;
    }
}

==

codeafter==
int main(void) {
	DListe l=NULL;
    int n;
    l=alloue_DCellule(0);
    lire(l);
    if(est_vide(l)==1)
        printf("la liste est vide\n");
    else{
        n=nb_elements(l);
        printf("la liste %d element%s\n",n,n>1?"s":"");
    }  
return 0;
}
==


tests==
[ ["Basique", "", "1 -5 10 0 -1"],
  ["Vide", "", ""],
  ["tete","","10 22 12"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20)+10)])]
  ]
==












