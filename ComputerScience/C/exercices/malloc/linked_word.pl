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
en argument une chaîne de caractères (venant d'une mémoire non pérenne). 
Votre fonction devra allouer une cellule et de la place mémoire pour 
recopier la chaîne de caractères sur une zone pérenne. Finalememt,
vous retournerez l'adresse de la cellule fraichement allouée avec
tous ces champs correctement renseignés.

==

editor.code==
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
#include <string.h>

typedef struct cell{
  char* word;
  struct cell* next;
}Cell, *List;

Cell* Allocate_cell(char* s){
  Cell* ans;

  ans = malloc( sizeof(Cell) );
  if (ans == NULL)
    return NULL;
  ans->word = malloc( (strlen(s) + 1) * sizeof(char) );
  if (ans->word == NULL){
    free(ans);
    return NULL;
  }
  strcpy(ans->word, s);
  ans->next = NULL;
  return ans;
}

==


codeafter==


int main(int argc, char* argv[]){
  Cell* ans=NULL;
  
  printf("Allocation\n");
  ans = Allocate_cell(argv[1]);
  printf("Utilisation\n");
  printf("value : %s\n", ans->word);
  printf("next : %p\n", (void*)ans->next); 
  printf("Libération\n");
  free(ans->word);
  free(ans);
  
  return 0;
}

==

tests==

[["Exécution simple", "mot", ""],
 ["Chaîne vide", "''", ""],
 ["Exécution simple", "'mot en plusieurs morceaux très long'", ""],
 ["Aléatoire", "".join([chr(ord('a')+random.randint(0,25)) for i in range(20)]), ""]]

==


