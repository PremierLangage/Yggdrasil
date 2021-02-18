

#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************


extends= /ComputerScience/Algo/Tree/templates/zipsprogCwithtree.pl

#author=Marc Zipstein
title=Ajout dans un arbre lexical fils gauche frère droit
tag=recherche

editor.height=300px

text== 
On représente un lexique avec un arbre fils gauche frère droit. On utilise le type:  
    typedef struct noeud{
        char lettre;
        struct noeud *filsg,*frered;
}Noeud,*Arbre;
Les noeuds freressont ordonnés dans l'ordre ascii,  
On ne traite  pas les accents- on confond "interne" et "interné"
un mot est une suite de moins de 257 caratères (telle que lue par scanf("%256s,mot))
Le caratère de fin de mot est conservé dans l'arbre.
ecrire une fonction nbarbre qui reçoit un arbre et renvoie son nombre de mots
==

editor.code==#|c|


int nbmots(Arbre t){
  if (t == NULL)
     return 0;
  if (t->lettre=='\0')
      return 1+nbmots(t->frered);
  return nbmots(t->filsg)+nbmots(t->frered) ;
}
==

solution==#|c|


int nbmots(Arbre t){
  if (t == NULL)
     return 0;
  if (t->lettre=='\0')
      return 1+nbmots(t->frered);
  return nbmots(t->filsg)+nbmots(t->frered) ;
} 
==



code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct noeud{
  char lettre;
  struct noeud *filsg;
  struct noeud *frered;
}Noeud,*Arbre;

Noeud * allocate_node(char val){
  Noeud * n = malloc(sizeof(Noeud));

  if (!n){
    fprintf(stderr, "problème allocation mémoire\n");
    return NULL;
  }
  n->filsg = NULL;
  n->frered = NULL;
  n->lettre = val;
  return n;
}
==

code_after==#|c|

void ajoute_branche  (Arbre *a,char *mot){
  if((*a=allocate_node(*mot))!=NULL){
    if (*mot != '\0')
      ajoute_branche  (&((*a)->filsg),mot+1);
  }
}

void ajoute_mot(Arbre *a, char *mot){
    if (*a==NULL)
	ajoute_branche(a,mot);
    else {
	if( (*a)->lettre < *mot) 
  ajoute_mot(&((*a)->frered),mot);
else
  if(( (*a)->lettre == *mot) && (*mot != '\0')) 
    ajoute_mot(&((*a)->filsg),mot+1);
  else
    if(*mot != '\0'){
      Arbre tmp=NULL;
      ajoute_branche(& tmp,mot);
      tmp->frered=*a;
      *a=tmp;
    }
 }
}

 int build_tree(Arbre * t){
    char mot[257];
   
    while(1==    scanf("%256s", mot))   {
      if (0==ajoute_mot(t,mot)){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
      }
    }
    return 1;
} 

int main(int argn,char * argv[]){
    Arbre t;
    build_tree(&t);
    printf("%d",nbmots(t));
    return 0;
    }
==



checks_args_stdin==#|python|
	[["Arbre feuille","","a"],
	 ["arbre à 3 mots","","le,la,les"]
	]
==