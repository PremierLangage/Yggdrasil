# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Recopier deux chaînes de caractère

author=Nicolas Borie
title=Deux chaînes à allouer et recopier dans une structure
tag=string|malloc|structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction qui prend en argument l'adresse d'une structure **People**
ainsi que deux chaînes de caractères. La structure 

==

editor.code==
typedef struct{
  char* first;
  char* last;
}People;

int initialize_People(People* p, char* fisrt_name, char* last_name){
    /* ... tant de choses ... */
}

==

solution==

typedef struct{
  char* first;
  char* last;
}People;

int initialize_People(People* p, char* fisrt_name, char* last_name){
    p->first = strdup(fisrt_name);
    p->last = strdup(last_name);

    return (p->first != NULL) && (p->last != NULL);
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

