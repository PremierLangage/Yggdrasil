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
Ecrire une fonction de protopype `int nb_inversions(int tab[],int taille);` qui renvoie le nombre d'inversions dans le tableau.<br>
Rappel: Une inversion dans un tableau $%t%$ est une pair d'indices `i<j` du tableau, tels que $% t[i]>t[j] %$.
<p>
Exemples : <br>
- Si le tableau contenait 3,1,2 les inversions sont les paires `(i,j)` suivants : `(0,1),(0,2)`. <br>
- Si le tableau contenait 1,3,2,0 les inversions sont les paires `(i,j)` suivants : `(0,3),(1,2),(1,3),(2,3)`. 
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

editor.code==#|c|
int nb_inversions(int tab[], int size){
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
[ ["simple éxécution", "","1 2 3 4 5"],
  ["avec deux négatifs", "","-1 -2"],
  ["aléatoire négatif", ""," ".join([str(random.randint(-30,-5)) for i in range(random.randint(5,10))])],
  ["aléatoire positif", ""," ".join([str(random.randint(0,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-100,100)) for i in range(random.randint(10,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==
