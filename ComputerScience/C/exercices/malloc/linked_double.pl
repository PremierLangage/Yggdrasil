# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Liste chaînée de double

author=Nicolas Borie
title=Cellule pour liste de double
tag=malloc|structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction d'allocation pour une cellule de liste chainée
contenant des doubles (un double par cellule). Une fonction d'allocation
raisonnable prépare de la mémoire pérenne, renseigne le double dans
la cellule et initialise la cellule de manière à ce qu'elle ne possède
pas de suivant. Finalement, on retourne l'adresse de la cellule correctement
allouée et initialisée.
==

editor.code==
#include <stdio.h>
#include <stdlib.h>

typedef struct cell{
  double value;
  struct cell* next;
}Cell, *List;

... Allocate_cell(double val){
  /* ... votre code ici ... */
}
==

solution==

#include <stdio.h>
#include <stdlib.h>


typedef struct cell{
  double value;
  struct cell* next;
}Cell, *List;

Cell* Allocate_cell(double val){
  Cell* ans;

  ans = (Cell*)malloc( sizeof(Cell) );
  if (ans == NULL)
    return ans;
  ans->next = NULL;
  ans->value = val;
  return ans;
}

==


codeafter==

int main(int argc, char* argv[]){
  Cell* ans=NULL;
  
  printf("Allocation\n");
  ans = Allocate_cell(3.141592);
  printf("Utilisation\n");
  printf("value : %f\n", ans->value);
  printf("next : %p\n", (void*)ans->next); 
  printf("Libération\n");
  free(ans);

}

==

tests==

[["Exécution simple", "", ""]]

==


