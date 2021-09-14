#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
title=Assemblage simple de fonctions
tag=programme|appel|fonction|simple|facile

editor.height=250px

text==

Écrire une fonction **show_cube** qui prend en argument un entier **n** 
(par exemple 3) et qui affiche une phrase donnant le cube de cet entier 
tout en rappelant cet entier (par exemple : *Le cube du nombre 3 est le 
nombre 9.*).

<br />

L'objectif est ici de ne presque rien coder mais de réutiliser les deux 
premières fonctions pour construire la troisième.

==

editor.code==
void display_info(int nb, int cube){
  printf("Le cube du nombre %d est le nombre %d.\n", nb, cube);
}

int calculate_cube(int nb){
  return nb*nb*nb;
}

void show_cube(int n){
  /* Votre code ici... */
}
==

solution==

void display_info(int nb, int cube){
  printf("Le cube du nombre %d est le nombre %d.\n", nb, cube);
}

int calculate_cube(int nb){
  return nb*nb*nb;
}

void show_cube(int n){
  display_info(n, calculate_cube(n));
}

==

code_before==

#include <stdio.h>
#include <stdlib.h>

==

code_after==

int main(int argc, char* argv[]){
  show_cube(atoi(argv[1]));

  return 0;
}

==

checks_args_stdin==
[["Exécution simple", ["1"], ""],
 ["Un classique", ["12"], ""],
 ["Un négatif", ["-7"], ""],
 ["Test aléatoire", [str(randint(-100, 100))], ""],
 ["Test aléatoire", [str(randint(-100, 100))], ""],
 ["Test aléatoire", [str(randint(-100, 100))], ""],
 ["Test aléatoire", [str(randint(-100, 100))], ""],
 ["Test aléatoire", [str(randint(-100, 100))], ""]]
==

astuces==#|python|
[
  { "content": """En langage C, on peut enchainer les appels de fonction `f(g(arg))` est par exemple le calcul de la fonction `g` sur l'argument `arg` et une fois ce calcul opéré, la fonction `f` est appliqué sur le résultat."""},
  { "content": """Il doit suffire de retourner la fonction `display_info` mais en lui donnant pour second argument un bon retour de la fonction `calculate_cube`."""}
]
==

