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

title=Calculer le nombre de nœuds internes dans un arbre binaire
tag=arbre|algo|feuille|récursivité|interne

editor.height=350px

text==
Écrire une fonction C **count_internal_nodes** qui prend en argument un **arbre** (un pointeur 
vers le `Node` racine de l'arbre) et retourne un entier qui devra 
être le **nombre de nœuds internes** dans l'arbre. Pour rappel, un nœud est 
interne quand il possède au moins un fils. De manière équivalente, un nœud 
qui n'est pas une feuille est un nœud interne.
==

editor.code==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

... count_internal_nodes(Tree t){
  /* Votre code ici... */
}
==

solution==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

int count_internal_nodes(Tree t){
  if (t == NULL)
    return 0;
  if ((t->left != NULL) || (t->right != NULL))
    return 1 + count_internal_nodes(t->left) + count_internal_nodes(t->right);
  return 0;
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
  int n;

  build_tree(&t);
  
  if ((n = count_internal_nodes(t)) <= 1)
    printf("L'arbre transmis sur l'entrée standard contient : %d noeud interne\n", n);
  else
    printf("L'arbre transmis sur l'entrée standard contient : %d noeuds internes\n", n);
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





