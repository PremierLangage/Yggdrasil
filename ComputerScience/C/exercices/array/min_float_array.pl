#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Minium d'un tableau de flotants
tag=array|fonction|parcours|simple|flotant


text==#|markdown|
Écrire une fonction `int update_min_array_float(float* tab, int size, float* min)` qui prend en 
argument un tableau de flotants, sa taille et un pointeur vers un flotant. Votre fonction devra 
retourner 0 si le tableau est vide et devra retourner 1 sinon tout en mettant à jour le pointeur
`min` dont la valeur pointée devra être le minimum des valeurs du tableau.
==

editor.code==#|c|
int update_min_array_float(float* tab, int size, float* min){
    /* Votre code ici... */
}
==

solution==#|c|
int update_min_array_float(float* tab, int size, float* min){
    int i;
    if (size <= 0)
        return 0;
    *min = tab[0];
    for (i=1 ; i<size ; i++)
        if (tab[i] < *min)
            *min = tab[i];
    return 1;
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

