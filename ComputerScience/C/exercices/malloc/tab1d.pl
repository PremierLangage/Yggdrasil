# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Allocation d'un tableau à une dimension

author=Nicolas Borie
title=Allocation d'un tableau à une dimension
tag=array|malloc
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction C **allocate_float_array** qui prend en argument une taille (sous la forme d'un entier)

==

editor.code==
... allocate_float_array(...){
    /* Votre code ici */
}

==

solution==
float average_array(int* tab, int size){
  int i;
  float sum = 0;

  if (size == 0)
    return 0;
  
  for (i=0 ; i<size ; i++)
    sum += tab[i];
  return sum / ((float)size);
}

==

codeafter==

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));
  int i;

  for (i=0 ; i<nb_term ; i++){
    tab[i] = atoi(argv[i+1]);
  }

  printf("Moyenne : %f\n", average_array(tab, nb_term));
  free(tab);
  return 0;
}

==

tests==

[["Exécution simple", "1", ""],
 ["Quelques éléments", "12 -3 52 0 41", ""],
 ["Tableau vide", "", ""],
 ["Aléatoire", " ".join([str(random.randint(-100,100)) for i in range(random.randint(5,10))]), ""],
 ["Aléatoire", " ".join([str(random.randint(-100,100)) for i in range(random.randint(5,10))]), ""]]

==



