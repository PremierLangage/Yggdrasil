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

extends=/ComputerScience/Algo/Tree/templates/std_progC_with_tree.pl

author=Nicolas Borie

title=Afficher les chemins racine-feuilles
tag=arbre|algo|feuille|récursivité|buffer

editor.height=400px

text==
Dans cet exercice, on souhaite produire du code pour afficher ligne par 
ligne tous les chemins de la racine d'un arbre binaire vers chacune de 
ses feuilles.

==

editor.code==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

#define MAX_HEIGHT 500

... print_buffer(int buffer[], int size){
  /* Votre code ici... */
}

... path_to_leafs_rec(Tree t, int buffer[], int index){
  /* Votre code ici... */
}

... path_to_leafs(Tree t){
  int buffer[MAX_HEIGHT];
  /* Votre code ici... */
}
==

solution==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

#define MAX_HEIGHT 500

void print_buffer(int buffer[], int size){
  int i;
  for(i=0 ; i<size-1 ; i++)
    printf("%d - ", buffer[i]);
  if (size > 0)
    printf("%d", buffer[size-1]);
  putchar('\n');
}

void path_to_leafs_rec(Tree t, int buffer[], int index){
  if ((t->left == NULL) && (t->right == NULL))
    print_buffer(buffer, index);
  else{
    buffer[index] = t->value;
    if (t->left)
      path_to_leafs_rec(t->left, buffer, index+1);
    if (t->right)
      path_to_leafs_rec(t->right, buffer, index+1);
  }
}

void path_to_leafs(Tree t){
  int buffer[MAX_HEIGHT];
  path_to_leafs_rec(t, buffer, 0);
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
Node* allocate_node(int val){
  Node* n = malloc(sizeof(Node));

  if (!n){
    fprintf(stderr, "problème allocation mémoire\n");
    return NULL;
  }
  n->left = NULL;
  n->right = NULL;
  n->value = val;
  return n;
}

int build_tree(Tree* t){
    int val;
    char c;
    
    scanf("%c", &c);
    scanf("%d", &val);
    if ((*t = allocate_node(val)) == NULL){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
    }
    switch(c) {
    case 'd': return build_tree(&((*t)->left)) && build_tree(&((*t)->right));
    case 'l': return build_tree(&((*t)->left));
    case 'r': return build_tree(&((*t)->right));
    case 'f': return 1;
      break;
    default :
      fprintf(stderr, "Arbre mal formé\n");
      return 0;
    }
    return 1;
}

int main(int argc, char* argv[]){
  Tree t=NULL;

  build_tree(&t);
  
  path_to_leafs(t);
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "f1"],
 ["Abre à 3 nœuds", [], "d2f1f3"],
 ["Peigne gauche", [], "l5l4l3l2l1f0"],
 ["Arbre aléatoire à 6 nœuds", [], random_binary_tree(6)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 8 nœuds", [], random_binary_tree(8)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 10 nœuds", [], random_binary_tree(10)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 12 nœuds", [], random_binary_tree(12)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 14 nœuds", [], random_binary_tree(14)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 100 nœuds", [], random_binary_tree(100)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 500 nœuds", [], random_binary_tree(500)[0].to_string_code().replace(' ', '')] ]
==



