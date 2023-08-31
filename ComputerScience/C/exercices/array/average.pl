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
tableau d'entiers (pointeur vers sa première case) ainsi que sa taille puis retourne 
un flotant qui devra être la moyenne des éléments contenus dans le tableau. 
Par convention, la moyenne d'un tableau vide devra être zéro.

<br />

<u>Rappel:</u> la moyenne est la somme de tous les élements divisée par le nombre d'élements.   

<br />
==

editor.code==#|c|
float average_array(...){
    /* Votre code ici */
}

==

solution==#|c|
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

code_before==

==

code_after==#|c|
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

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Quelques éléments", ["12", "-3", "52", "0", "41"], ""],
 ["Tableau vide", [], ""],
 ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
 ["Test aléatoire 2", [str(randint(-100, 100)) for i in range(randint(10, 15))], ""],
 ["Test aléatoire 3", [str(randint(-100, 100)) for i in range(randint(10, 15))], ""]]
==

