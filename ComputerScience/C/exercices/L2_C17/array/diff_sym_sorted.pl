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

title=Différence symmétrique en une seule passe!
tag=array|tableau|fonction|difficile|algorithme|linéaire|optimal|ensembles|trié

editor.height=350px

text==#|markdown|
L'objectif est ici de concevoir une fonction performante pour
visualiser la différence symmétrique entre deux ensembles. On peut
facilement représenter un ensemble d'entiers avec des tableaux triés
(strictement d'ailleurs car il ne peut pas y avoir de répétitions). 
Par exemple, un ensemble  $% \\lbrace 12, 5, 7, 14, 2 \\rbrace %$ peut
être encodé de manière canonique par le tableau C de taille 5 : 
`[2, 5, 7, 12, 14]`.


La différence symmétrique $% A \bigtriangleup B %$ entre deux ensembles $% A %$ et $% B %$ est par 
définition 

$$ A \bigtriangleup B := \lbrace x \in A | x \notin B \rbrace \cup \lbrace x \in B | x \notin A \rbrace = (A \smallsetminus B) \cup (B \smallsetminus A) = (A \cup B) \smallsetminus (A \cap B)$$

En francais, les éléments de $% A \bigtriangleup B %$ sont seulement dans $% A %$ ou
seulement dans $% B %$. Maintenant, si $% A %$ et $% B %$ sont deux tableaux triés
de manière strictement croissante, vous devrez coder une fonction dont le
prototype sera : 

`void print_diff_sym(int* A, int s1, int* B, int s2)` 

Cette dernière devra afficher le contenu de la différence symmétrique toujours de manière
triée. Il est possible de la faire efficacement, en seule passe, avec
double têtes de lecture. Les têtes de lecture pointent toujours sur les
minimums respectifs de $% A %$ et de $% B %$. Si ces derniers sont différents,
on affiche le plus petit des deux et on avance la tête de lecture
associée. Si les deux têtes pointent vers le même élément, on affiche
rien (car l'élément est dans les deux ensembles en même temps) et on
avance les deux têtes de lecture d'un cran.

Voici des exemples d'éxécution avec des tableaux de taille 10 aléatoires.


    A : 1 3 5 6 7 9 13 14 16 18   
    B : 2 3 7 10 13 14 16 18 22 25   
    A diff B : 1 2 5 6 9 10 22 25   
    
    A : 1 4 6 7 8 12 15 16 18 20   
    B : 2 6 8 9 10 13 17 21 22 26   
    A diff B : 1 2 4 7 9 10 12 13 15 16 17 18 20 21 22 26   

Par soucis de simplicité, écrivez systématiquement un nombre puis un espace. Tant pis 
pour l'espace final inutile, écrivez tous les nombres de votre solution avec la 
commande `printf("%d ", ...)`.
==

code_before==#|c|
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void print_array(int* t, int s){
  int i;

  for (i=0 ; i<s ; i++){
    printf("%d ", t[i]);
  }
  putchar('\n');
}
==

code_after==#|c|
int main(int argc, char* argv[]){
  int size=atoi(argv[1]);
  int* A;
  int* B;
  int i;
  
  A = malloc(4*size);
  B = malloc(4*size);

  srand(time(NULL));

  A[0] = rand() % 4;
  B[0] = rand() % 4;
  for (i=1 ; i<size ; i++){
    A[i] = A[i-1] + 1 + (rand() % 4);
    B[i] = B[i-1] + 1 + (rand() % 4);
  }

  printf("A : ");
  print_array(A, size);
  printf("B : ");
  print_array(B, size);
  printf("A diff B: ");
  print_diff_sym(A, size, B, size);
  putchar('\n');
  return 0;
}
==

editor.code==#|c|
void print_diff_sym(int* t1, int s1, int* t2, int s2){
  /* Votre code ici... */
}
==

solution==#|c|
void print_diff_sym(int* t1, int s1, int* t2, int s2){
  int i1=0;
  int i2=0;

  /* As at least ont of the two arrays is not over */
  while(i1+i2 < s1+s2){
    if ((i1 < s1) && (i2 < s2)){ /* Both array alive */
      if (t1[i1] < t2[i2])
	printf("%d ", t1[i1++]);
      else if (t1[i1] > t2[i2])
	printf("%d ", t2[i2++]);
      else{ /* Same element, so no printing... */
	i1++;
	i2++;
      }
    }
    else if (i1 < s1)           /* only t1 is alive */
      printf("%d ", t1[i1++]);
    else                        /* only t2 is alive */
      printf("%d ", t2[i2++]);
  }
}
==

checks_args_stdin==#|python|
[ ["Test aléatoire de taille 1", ["1"], ""],
  ["Test aléatoire de taille 2", ["2"], ""],
  ["Test aléatoire de taille 3", ["3"], ""],
  ["Test aléatoire de taille 4", ["4"], ""],
  ["Test aléatoire de taille 5", ["5"], ""],
  ["Test aléatoire de taille 10", ["10"], ""],
  ["Test aléatoire de taille 20", ["20"], ""],
  ["Test aléatoire de taille 30", ["30"], ""], ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==


