


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

extends=/ComputerScience/C/template/std_progC.pl


#author=Marc Zipstein
title=Appartenance dans un arbre lexical fils gauche frère droit
tag=recherche

editor.height=300px

text== 
On représente un lexique avec un arbre fils gauche frère droit. On utilise le type:  
    typedef struct noeud{
        char lettre;
        struct noeud *filsg,*frered;
}Noeud,*Arbre;
Ecrire une fonction **nbmotsapprtient** qui reçoit un arbre et un mot. a fonction renvoie 1 si 
le mot appartient au lexique rerésenté par l'arbre.
==

editor.code==#|c|

int appartient(Arbre t,char *mot){
    if (t == NULL)
        return 0;
    if (t->lettre<*mot)
        return appartient(t->frered,mot);
    if (t->lettre > *mot)
        return 0;

    if (*mot=='\0')
      return 1;
    return appartient(t->filsg,mot+1) ;
} 

==

solution==#|c|


int appartient(Arbre t,char *mot){
    if (t == NULL)
        return 0;
    if (t->lettre<*mot)
        return appartient(t->frered,mot);
    if (t->lettre > *mot)
        return 0;

    if (*mot=='\0')
      return 1;
    return appartient(t->filsg,mot+1) ;
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
    fprintf(stderr, "problème allocation mémoire.\n");
    return NULL;
  }
  n->filsg = NULL;
  n->frered = NULL;
  n->lettre = val;
  return n;
}
==

code_after==#|c|

int ajoute_branche  (Arbre *a,char *mot){
  if((*a=allocate_node(*mot))!=NULL){
    if (*mot != '\0')
     return ajoute_branche  (&((*a)->filsg),mot+1);
  return 1;    
  }
  return 0;
 }

int ajoute_mot(Arbre *a, char *mot){
  if (*a==NULL)
  	return ajoute_branche(a,mot);
  if( (*a)->lettre < *mot) 
    return ajoute_mot(&((*a)->frered),mot);
  if(( (*a)->lettre == *mot) && (*mot != '\0')) 
    return ajoute_mot(&((*a)->filsg),mot+1);
  if(*mot != '\0'){
      Arbre tmp=NULL;
      if(ajoute_branche(& tmp,mot)){
        tmp->frered=*a;
        *a=tmp;
        return 1;
        }
      return 0;  
    }
  return 1;
 }


 int build_tree(Arbre * t){
    char mot[257];
   
    while(1==    scanf("%256s", mot))   {
      if (0==ajoute_mot(t,mot)){
      fprintf(stderr, "problème allocation mémoire*\n");
      return 0;
      }
    }
    return 1;
} 

int main(int argn,char * argv[]){
    Arbre t;
    build_tree(&t);
    if(appartient (t,"le"))
        fprintf(stderr," le est dans le lexique");
    else
        fprintf(stderr,"le n'est pas dans le lexique");
    return 0;
    }
==



checks_args_stdin==#|python|
	[["Arbre feuille","","a"],
	 ["arbre à 3 mots","","le ,la ,les "],
   ["arbre aléatoire","","un ,une ,du ,de ,des"+" ,"+choice(['dune',"deux","le","route","un","une"])]
	]
==