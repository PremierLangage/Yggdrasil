# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Allocation d'un tableau à une dimension

author=Nicolas Borie
title=Allocation d'un tableau à une dimension
tag=array|malloc
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction C **allocate_float_array** qui prend en argument une 
taille **size** (sous la forme d'un entier) et qui un tableau pouvant 
contenir **size** flottants simple précision.

==

editor.code==
typedef struct{
  char* first;
  char* last;
}People;

... allocate_float_array(...){
    /* Votre code ici */
}

==

solution==

float* allocate_float_array(int size){
  float* ans = (float *)malloc( size * sizeof(float) );
  return ans;
}

==

codebefore==

#include <stdlib.h>

==

codeafter==

#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  int size = atoi(argv[1]);
  float* ans;

  srand(time(NULL));

  ans = allocate_float_array(size);
  if (ans == NULL){
    printf("Not Enough Memory.\n");
    return 0;
  }
  if (size >= 2){
    ans[0] = rand();
    ans[size-1] = rand();
    printf("Allocation et utilisation : %f (devrait valoir zéro...)\n", ans[size-1] - ans[size-1]);
  }
  free(ans);
  return 0;
}

==

tests==

[["Exécution simple", "1", ""],
 ["Tableau vide", "0", ""],
 ["Tableau moyen", "46", ""],
 ["Aléatoire", str(random.randint(1, 1000000)), ""],
 ["Aléatoire", str(random.randint(1, 1000000000)), ""],
 ["Aléatoire", str(random.randint(1000000000, 2000000000)), ""]]

==

