
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
extends= minimum_abr.pl
#author=Marc Zipstein
title=Extraire dans un arbre binaire de recherche
tag=recherche

editor.height=300px

text== 
Écrire une fonction C **extraire** qui extrait une valeur d'un **arbre binaire de recherche**.
La fonction renvoie 1 en cas d'extraction réussie et 0 sinon.  
S'il y a deux fils, la valeur sera remplacée par le minimum du sous-arbre droit.
On pourra utiliser la fonction extraire_minimum écrite plus tot (vous n'avez pas besoin d'en mettre une copie dans votre réponse).



On utilisera le type   
typedef struct node{  
  int value;  
  struct node * left;  
  struct node * right;  
}Node, *Tree;  

==

editor.code==#|c|

int extraire(Tree *t,int val){
  
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

int extraire_minimum(Tree *t,int *min){
  Tree a,tmp;
  if(*t==NULL)
    return 0;
  a=*t;
  if(a->left==NULL){
    *min=(*t)->value;
    *t=(*t)->right;
    free(a);
    return 1;
  }
  while(a->left->left!=NULL)
    a=a->left;
  *min=a->left->value;
  tmp=a->left;
  a->left=a->left->right;
  free(tmp);
  return 1;
}

==




solution==#|c|

int extraire(Tree *t,int val){
  Tree a;
  int n;
  if(*t==NULL)
    return 0;
  a=*t;
  if(a->value>val){
    return extraire(&((*t)->left),val);
  }
  if(a->value<val)
  return  extraire(&((*t)->right),val);
  if(a->value!=val)
  return 0;
  
   if((*t)->left==NULL && (*t)->right==NULL){
    free(*t);
    *t=NULL;return 1;
    }
  if((*t)->left==NULL){
      a=*t;
    *t=(*t)->right;
    free(a);
    return 1;
    }   
    if((*t)->right==NULL){
         a=*t;
    *t=(*t)->left;
    free(a);
    return 1;
    }   
extraire_minimum(&((*t)->right),&n);
(*t)->value=n;
return 1;
}


==


checks_args_stdin==#|python|
[["Arbre feuille", [], "4"],
 ["Abre à 3 nœuds", [], "4 2 5"],
 ["Peigne gauche", [], "12 10 9 8 7 4 0"],
 ["Peigne droit", [], "7 8 9 10 12 55"],
 ["Arbre aléatoire ", [],choice (["42 4 22 52 5 66 70","1 2 3 1 7 42 12 4"])],
  ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(10) ])+"4"]
]
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

int nbfree=0;

void free(void *dummy){
  nbfree++;
  }

int main(int argc, char* argv[]){
  Tree t=NULL;
char *code;
int x;


  build_tree(&t);
 
   code=arbre_vers_code(t);
    
  fprintf(stderr,"arbre avant %s\n",code) ;

 extraire(&t,4);
   
   code=arbre_vers_code(t);
    
  fprintf(stderr,"arbre après %s\n",code) ;
 
  printf("Nombre de libérations : %d \n",nbfree);
  return 0;
}
==
