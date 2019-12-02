# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Matrice carrée d'entiers

author=Nicolas Borie
title=Matrice carrée d'entiers
tag=malloc|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction qui alloue et initialise une matrice carrée d'entiers dont 
la taille sera donnée en argument.

Pour `n=7`, votre fonction devra allouer et initialiser une matrice comme il suit :

    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7

==

editor.code==
#include <stdio.h>
#include <stdlib.h>

int** square_matrix(int size){
  /* ... votre code ici ... */
}

==

solution==

#include <stdio.h>
#include <stdlib.h>

int** square_matrix(int size){
  int** ans;
  int i, j;

  ans = malloc(size * sizeof(int*));
  for(i=0 ; i<size ; i++){
    ans[i] = malloc(size * sizeof(int));
    for(j=0 ; j<size ; j++)
      ans[i][j] = j+1;
  }
  return ans;
}

==


codeafter==


int main(int argc, char* argv[]){
  int i, j;
  int n = atoi(argv[1]);
  int** ans;

  ans = square_matrix(n);

  for (i=0 ; i<n ; i++){
    for (j=0 ; j<n ; j++){
    printf("%2d ", ans[i][j]);
    }
    putchar('\n');
    free(ans[i]);
  }
  free(ans);

  return 0;
}

==

tests==
[["Sinple", "1", ""],
 ["Moyen", "5", ""],
 ["Aléatoire", str(random.randint(5, 10)), ""],
 ["Aléatoire", str(random.randint(11, 15)), ""],
 ["Aléatoire", str(random.randint(16, 20)), ""]]

==


