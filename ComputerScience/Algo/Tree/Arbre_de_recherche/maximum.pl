

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
#**************************************************************************
#extends=/ComputerScience/Algo/Tree/templates/zipsprogCwithtree.pl
extends=/ComputerScience/C/template/std_progC.pl
#author=Marc Zipstein
title= maximum d'un arbre binaire de recherche
tag=recherche

editor.height=300px

text== 
Écrire une fonction C ** maximum** qui retourne le maximumun d'un **arbre binaire de recherche**.
La fonction renvoie 1 en cas d'extraction réussie et 0 sinon.La valeur du max est réciupérée par un passage par adresse.

On utilisera le type   
typedef struct node{  
  int value;  
  struct node * left;  
  struct node * right;  
}Node, *Tree;  



==

editor.code==#|c|

int maximum(Tree t,... max){

  }


==

solution==#|c|

int maximum(Tree t,int *max){
  if(t==NULL)
    return 0;
  while(t->right)
    t=t->right;
  *max= t->value ;
  return 1;
}



==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TCODE 300
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

Node * allocate_node(int val){
  Node * n = malloc(sizeof(Node));

  if (!n){
    fprintf(stderr, "problème allocation mémoire\n");
    return NULL;
  }
  n->left = NULL;
  n->right = NULL;
  n->value = val;
  return n;
}

==

code_after==#|c|


int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if (((*t)->value >valeur))
    return ajoute(&((*t)->left),valeur);
  if (((*t)->value <valeur))
    return ajoute(&((*t)->right),valeur);

  return 1;
} 

int build_tree(Tree* t){
    int val;
   
    while(1==    scanf("%d", &val))   {
      
      if (0==ajoute(t,val)){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
      }
    }
    return 1;
}
void arbre_vers_code_aux(Tree t,char* s){ 
      char c;
      if(t->left !=NULL && t->right!=NULL)  c='d';
  else if(t->left !=NULL && t->right==NULL) c='l';
  else if(t->left ==NULL && t->right!=NULL) c='r';
  else c='f';
  sprintf(s+strlen(s),"%c",c);
  sprintf(s+strlen(s),"%d",t->value); 
  if(t->left)
       arbre_vers_code_aux(t->left,s+strlen(s));
 if(t->right)
       arbre_vers_code_aux(t->right,s+strlen(s));
}

char *arbre_vers_code(Tree t){
  static char s[300] ;
    s[0]='\0';
  if(NULL!=t)
    arbre_vers_code_aux(t,s);
  s[strlen(s)]= 0;
  return s;
}
   
int main(int argc, char* argv[]){
  Tree t=NULL;
   int x;


  build_tree(&t);
  if (maximum(t,&x)==1)
    fprintf(stderr,"maximum = %d\n",x) ;
  else
    fprintf(stderr," arbre vide \n");
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "4"],
 ["Abre à 3 nœuds", [], "4 2 5"],
 ["Peigne gauche", [], "12 10 9 8 7 0"],
 ["Peigne droit", [], "7 8 9 10 12 55"],
 ["Arbre aléatoire ", [],choice (["42 22 52 5 66 70","1 2 3 1 7 42 12"])],
  ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(10) ])]
]
==





