#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Moyenne des éléments d'un tableau
tag=array|fonction|parcours|simple


text==
Écrire une fonction C **average_array** qui prend en argument un
tableaux d'entiers (pointeur vers la première case) ainsi que sa taille puis retourne 
un flotant qui devra être la moyenne des éléments contenus dans le tableaux. 
Par convention, la moyenne d'un tableau vide devra être zéro.


<u>Rappel:</u> la moyenne est la somme de tous les élements divisée par le nombre 
d'élements.
==

editor.code==
float average_array(...){
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


