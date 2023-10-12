


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

extends=/ComputerScience/C/template/std_progC.pl
#author=Marc Zipstein
title=Rechercher dans un arbre binaire de recherche
tag=recherche

editor.height=300px

text== 
Écrire une fonction C **appartient** qui rechercheune valeur dans un **arbre binaire de recherche**.
La fonction renvoie 1 si la valeur est dans l'arbre et 0 sinon.

On utilisera le type   
typedef struct node{  
  int value;  
  struct node * left;  
  struct node * right;  
}Node, *Tree;  

==

editor.code==#|c|

int appartient(Tree t,int val){
 
}

==

solution==#|c|

int appartient(Tree t,int val){
if(t== NULL)
    return 0;
if (t->value>val)
    return appartient(t->left,val) ;   
if(t->value<val)
    return appartient(t->right,val);
return 1;
 }

==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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

int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if ((*t)->value >valeur)
    return ajoute(&((*t)->left),valeur);
  if ((*t)->value <valeur)
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

int nbrealloc=0;
void *dobob(void *p, int size){
    nbrealloc++;
    return realloc(p,size);
}

#define realloc dobob
==

code_after==#|c|


int main(int argc, char* argv[]){
  Tree t=NULL;


  build_tree(&t);
  if(appartient(t,4))
    printf(" 4 appartient à l'arbre \n");
else
   printf(" 4 n'appartient pas à l'arbre \n");
 if(appartient(t,42))
    printf(" 42 appartient à l'arbre \n");
else
   printf(" 42 n'appartient pas à l'arbre \n");
return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "4"],
 ["Abre à 3 nœuds", [], "4 2 5"],
 ["Peigne gauche", [], "12 10 9  8 7 4 0"],
 ["Peigne droit", [], "7 8 9 10 12 55"],
 ["Arbre aléatoire ", [],choice (["42 22 52 5 66 70","1 2 3 1 7 42 12"])],
  ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(10) ])+"4"]
]
==
