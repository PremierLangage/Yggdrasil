# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Liste chaînée de chaînes de caractères

author=Nicolas Borie
title=Cellule pour contenir un mot
tag=malloc|structure|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction d'allocation pour une cellule de liste chainée
contenant un mot (une chaîne de caractères). Votre fonction prendra
en argument une chaîne (venant d'une mémoire non pérenne). Votre
fonction devra allouer une cellule et de la place mémoire pour 
recopier la chaîne de caractères sur une zone pérenne. Finalememt,
vous retournerez l'adresse de la cellule fraichement allouée avec
tous ces champs correctement renseignés.

==

editor.code==
#include <stdio.h>
#include <stdlib.h>

typedef struct cell{
  char* word;
  struct cell* next;
}Cell, *List;

... Allocate_cell(char* s){
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
  
  return 0;
}

==

tests==

[["Exécution simple", "", ""]]

==


