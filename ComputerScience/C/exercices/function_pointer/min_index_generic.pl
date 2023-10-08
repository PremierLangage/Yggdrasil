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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie
title=Index du minimum générique
tag=function|type|pointer|array|function_pointer

text==#|markdown|
Écrire une fonction C **min_index** dont le prototype est presque le même que 
la fonction qsort. La 
fonction prendra donc en argument un tableau générique (son adresse, son nombre 
d'éléments puis la taille mémoire de chaque élément) mais aussi une fonction de 
comparaison. La fonction devra retourner l'index de l'élément minimal du tableau, 
selon la fonction de comparaison. Si le tableau est vide, votre fonction devra
retourner -1.

Pour rappel, une fonction de comparaison correcte vis à vis du langage C, 
évaluée sur des données X (premier argument) et Y (second argument) retourne un 
entier négatif, nul ou positif respectivement lorsque X < Y, X = Y ou X > Y.
Si le tableau contient plusieurs occurences de son minimum, retournez l'indice 
le plus petit indexant un minimum.
==

editor.code==#|c|
int min_index(void *base, size_t nmemb, size_t size, 
                 int (*compar)(const void *, const void *)){
  /* Votre code ici... */
}
==

solution==#|c|
int min_index(void *base, size_t nmemb, size_t size, 
                 int (*compar)(const void *, const void *)){
  int ind=0;
  int i;

  char* tab = (char*)base;
  if (nmemb <= 0)
    return -1;
  for(i=1 ; i<nmemb ; i++)
    if (compar(tab+(i*size), tab+(ind*size)) < 0)
      ind = i;
  return ind;
}

==

code_before==#|c|
#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
#include <stdio.h>
#include <string.h>

int cmpint(const void *a, const void *b){
  const int* n = (const int*)a;
  const int* m = (const int*)b;
  return *n - *m;
}

int cmpchar(const void *a, const void *b){
  char* n = *((char**)a);
  char* m = *((char**)b);

  return strcmp(n, m);
}

int main(int argc, char* argv[]){
  int array[20];
  char mot[300];
  char** tab=malloc(50*sizeof(char*));
  int i;

  if (strcmp(argv[1], "int") == 0){
    i = 0;
    putchar('[');
    while(scanf("%d", array+i) == 1){
      i++;
      if (i != 1)
        printf(", ");
      printf("%d", array[i-1]);
    }
    printf("] --> %d", min_index(array, i, sizeof(int),cmpint));
  }
  else{
    i = 0;
    putchar('[');
    while(scanf("%s", mot) == 1){
      tab[i] = strdup(mot);
      i++;
      if (i != 1)
        printf(", ");
      printf("%s", tab[i-1]);
    }
    printf("] --> %d", min_index(tab, i, sizeof(char*), cmpchar));
  }

  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["int"], "12 9 4 19 1 7 32 21"],
 ["Tableau vide", ["int"], ""],
 ["Test aléatoire entier 1", ["int"], " ".join([str(randint(-100, 100)) for i in range(randint(5, 15))])],
 ["Test aléatoire entier 2", ["int"], " ".join([str(randint(-100, 100)) for i in range(randint(5, 15))])],
 ["Test aléatoire entier 3", ["int"], " ".join([str(randint(-100, 100)) for i in range(randint(5, 15))])],
 ["Quelques mots (ordre lex)", ["char*"], "bbbb ccc tttt aa zzzz ddd eee aa\n"],
 ["Test aléatoire mots 1", ["char*"], " ".join(["".join([chr(randint(97,122)) for j in range(randint(1,8))]) for i in range(randint(5, 15))])],
 ["Test aléatoire mots 2", ["char*"], " ".join(["".join([chr(randint(97,122)) for j in range(randint(1,8))]) for i in range(randint(5, 15))])],
 ["Test aléatoire mots 3", ["char*"], " ".join(["".join([chr(randint(97,122)) for j in range(randint(1,8))]) for i in range(randint(5, 15))])]]
==


