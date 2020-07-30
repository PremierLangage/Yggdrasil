




title= Ajout dans une file
tag=file

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 

text==  
On utilise une liste circulaire pour représenter une file d'attente (premier 
entré premier sorti).  
L'acces à la liste est donc la dernière cellule de la file.
Ecrire une fonction `void ajout(File* f,int x)` ajoute x comme dernier élément. 
On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste  
typedef Liste File;
==

editor.code==
void ajout(File* f,int x){
File tmp=alloue_Cellule (x);
if(*f==NULL)
    *f=tmp;
else{
    tmp->suivant=(*f)->suivant;
    (*f)->suivant=tmp;
    *f=(*f)->suivant;
    }
}

==
solution==
void ajout(File* f,int x){
File tmp=alloue_Cellule (x);
if(*f==NULL)
    *f=tmp;
else{
    tmp->suivant=(*f)->suivant;
    (*f)->suivant=tmp;
    *f=(*f)->suivant;
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
typedef Liste File;

void affiche(File lst){
File debut=lst;
if(lst!=NULL)
do{
    printf("%d ",lst->suivant->val);
    lst=lst->suivant;
}while(lst !=debut);
    printf("\n");
    }
Cellule* alloue_Cellule(int x){
Liste tmp=NULL;

if((tmp=(Liste)malloc(sizeof(Cellule)))!=NULL){
    tmp->val=x;
    tmp->suivant=tmp;
    }
return tmp;
}

==

codeafter==
 

int main(void) {
	File l=NULL;
    int x;
    while(scanf("%d",&x)==1)
    ajout(&l,x);
    affiche(l);
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20))])+" -1"]
  ]
==







