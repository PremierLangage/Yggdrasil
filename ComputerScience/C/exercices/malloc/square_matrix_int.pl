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
  char** ans;

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

[["Exécution simple", "1", "1\nmot"],
 ["Chaînes vides", "0", "0\n"],
 ["Quatre chaîne", "4", "4\nun\ndeux\ntrois\nquatre"],
 ["Fibonacci", "7", "7\na\nb\ncc\nddd\neeeee\nffffffff\nggggggggggggg"],
 ["Exemple", "6", "6\npremière\nseconde\ntroisième\nencore\npresque\nfini"],
 ["Aléatoire", "10", "\n".join(random.choices(['red', 'black', 'green'], [2,2,2], k=10))],
 ["Aléatoire", "10", "\n".join(random.choices(['red', 'black', 'green'], [2,2,2], k=10))]]

==


