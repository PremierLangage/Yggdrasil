



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
title=Appartenance à un arbre lexical fils gauche frère droit
tag=recherche

editor.height=300px

text== 
On représente un lexique avec un arbre fils gauche frère droit.  
On utilise le type:   
    typedef struct noeud{  
        char lettre;  
        struct noeud *filsg,*frered;  
}Noeud,*Arbre;  
Ecrire une fonction **appartient ** qui reçoit un arbre et un mot et indique le mot appartient à l'arbre. 
La fonction renvoie 1 si le mot appartient à  l'arbre et 0 sinon..
==

editor.code==#|c|

int appartient(Arbre a,char *mot){
    
  }
==

solution==#|c|
int appartient(Arbre a,char *mot){
    if(a==NULL)
        return 0;
    if (*mot>a->lettre)
        return appartient(a->frered,mot);
    if(*mot< a->lettre)
     return 0;

    if (*mot != '\0')
        return appartient(a->filsg,mot+1);
  return 1;    
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
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
      }
    }
    return 1;
} 
void arbre_vers_code(  Arbre t,char *s){
    /*l'arbre vide est codé par '-'
    '\0' est codé par '.'
    */
    if(t==NULL){
        s[strlen(s)]='-';
        s[strlen(s)]='\0';

        return;
    }
    if(t->lettre=='\0'){
        s[ strlen(s)]='.';
        s[strlen(s)]='\0';
        arbre_vers_code(t->frered,s);
        return;
        }
    s[strlen(s)]=t->lettre;
        s[strlen(s)]='\0';   
    arbre_vers_code(t->filsg,s);
    arbre_vers_code(t->frered,s);
}
int main(int argc,char * argv[]){
    Arbre t=NULL;
     

    build_tree(&t);
    
    if(appartient(t,"le"))
    fprintf(stderr,"-le- est dans l'arbre");
    else
    fprintf(stderr,"-le- n'est pas dans l'arbre");
    return 0;
    }
==




checks_args_stdin==#|python|
	[["Arbre 1 mot","","a "],
	 ["arbre à 3 mots","","le la les "],
   ["arbre aléatoire","","un une du de des"+" "+choice(['dune',"deux","le","route","un","une"])]
	]
==

