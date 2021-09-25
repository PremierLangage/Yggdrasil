#*****************************************************************************
#  Copyright (C) 2020 Marc Zipstein
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

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Comptage d'inversions dans un tableau

tag=tableau|fonction|astuce|paires

author=Marc Zipstein

text==#|markdown|
Écrire une fonction de protopype `int nb_inversions(int t[], int taille);` qui renvoie le 
nombre d'inversions contenues dans le tableau `tab` de taille `taille` donné en argument.   
Rappel: Une inversion dans un tableau `t` est une paire d'indices `i < j` du tableau, 
tels que `t[i] > t[j]`.

<br>

<u>Exemples :</u>   
- Si le tableau contenait `[3, 1, 2]` les inversions sont les paires `(i, j)` suivantes : 
`(0, 1)` et `(0, 2)`. Dans ce cas, votre fonction devrait donc retourner `2`.   
- Si le tableau contenait `[1, 3, 2, 0]` les inversions sont les paires `(i, j)` suivantes : 
`(0, 3), (1, 2), (1, 3)` et `(2, 3)`. Dans ce cas, votre fonction devrait donc retourner `4`.    
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

editor.code==#|c|
int nb_inversions(int t[], int taille){
  // Votre code ici...
}
==

solution==#|c|
int nb_inversions(int tab[], int size){
  int i,j;
  int nb=0;
  for(i=0 ; i<size ; i++)
    for(j=i+1;j<size;j++)
        if (tab[i] > tab[j])
            nb++;
  return nb;
} 
==

code_after==#|c|
int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }

  printf("la suite comprends %d inversion(s)\n",nb_inversions(tab,size));
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", [], "1 2 3 4 5"],
  ["Deux négatifs", [], "-1 -2"],
  ["Test aléatoire négatif", [], " ".join([str(randint(-30,-5)) for i in range(randint(5,10))])],
  ["Test aléatoire positif", [], " ".join([str(randint(0,20)) for i in range(randint(5,10))])],
  ["Test aléatoire 1", [], " ".join([str(randint(-20,20)) for i in range(randint(5,10))])],
  ["Test aléatoire 2", [], " ".join([str(randint(-10,10)) for i in range(randint(5,10))])],
  ["Test aléatoire 3", [], " ".join([str(randint(-100,100)) for i in range(randint(10,20))])],
  ["Test aléatoire 4", [], " ".join([str(randint(-10,10)) for i in range(randint(5,20))])],
  ["Test aléatoire 5", [], " ".join([str(randint(-20,20)) for i in range(randint(5,20))])], ]
==

astuces==#|python|
[
  { "content": """La difficulté de cet exercice est de savoir parcourir toutes les paires `(i, j)` d'indices valides et différents. Il faut bien imbriquer deux boucles `for` mais il faut le faire correctement."""},
  { "content": """Si vous avez utilisé une variable locale `i` pour votre première boucle, une bonne solution consiste à faire commencer la seconde boucle à `i+1`. Ainsi les paires d'indices générées seront bien uniques."""},
  { "content": """Une solution élémentaire est d'imbriquer les boucles `for(i=0 ; i<size ; i++)` et `for(j=i+1 ; j<size ; j++)` et de mettre à jour une variable accumulant `1` à chaque fois que `t[j] < t[i]`."""}
]
==
