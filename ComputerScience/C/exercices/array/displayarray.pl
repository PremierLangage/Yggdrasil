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

title=Afficher le contenu d'un tableau
tag=array|affichage|tableau|fonction


text==
Écrire une fonction qui affiche le contenu d'un tableau C. Cette
fonction prendra en paramèrtre un tableau d'entiers ainsi que le
nombre d'éléments contenu dans ce tableau. Tester votre fonction en
l'appelant correctement avec le tableau défini comme varible locale de
la fonction *main*. On commencera l'affichage avec un crochet ouvrant,
puis les entiers séparé par une virgule et enfin un crochet fermant en
fin de tableau.
==

code_before==

==

code_after==

==

editor.code==
#include ...

void display_array(int* array, int nb_term){
  /* votre code ici... */
}

int main(int argc, char* argv[]){
  int tab[] = {6, 2, 3, 7, 7, 9, 2};

  /* votre code ici... */
}
==

solution==
#include <stdio.h>

void display_array(int* array, int nb_term){
  int i;

  printf("[");
  for (i=0 ; i<nb_term-1 ; i++)
    printf("%d, ", array[i]);
  printf("%d]\n", array[nb_term-1]);
}

int main(int argc, char* argv[]){
  int tab[] = {6, 2, 3, 7, 7, 9, 2};

  display_array(tab, 7);
  return 0;
}
==


checks_args_stdin==#|python|
[["Exécution simple", [], ""]]
==


