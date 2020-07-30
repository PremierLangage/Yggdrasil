
title= Ajout dans une file
tag=file

extends=/ComputerScience/C/template/stdsandboxC.pl
author= 

text==  
On utilise une liste circulaire pour représenter une file d'attente (premier 
entré premier sorti).  
L'acces à la liste est donc la dernière cellule de la file.
Ecrire une fonction `int  extrait(File* f,File* x)` retire le premier de la file,
s'il existe,le place  à l'adresse x et renvoie 1;
Si la file est ide on se contanye de renvoyer 0. 
On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste  
typedef Liste File;
==

editor.code==
int  extrait(File *f,File *x){
  
  if(*f==NULL)
    return 0;
  *x=(*f)->suivant;
  (*f)->suivant=(*x)->suivant;
  return 1;
}

==
solution==
int  extrait(File *f,File *x){
  
  if(*f==NULL)
    return 0;
  *x=(*f)->suivant;
  (*f)->suivant=(*x)->suivant;
  return 1;
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

codeafter==
 

int main(void) {
	File l=NULL,cel;
    int x;
    while(scanf("%d",&x)==1)
    ajout(&l,x);
    extrait(&l,&cel); extrait(&l,&cel);
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







