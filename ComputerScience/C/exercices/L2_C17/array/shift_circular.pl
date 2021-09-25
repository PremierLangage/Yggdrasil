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

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Décalage circulaire dans les deux sens

tag=tableau|fonction|parcours

author=Prog C L2 Team

text==#|markdown|
Écrire une fonction `void shiftLR(int a[], int b[], int size)` qui reçoit deux tableaux, `tab1` et `tab2`, 
ainsi que leur taille et effectue un décalage circulaire d'une case vers la droite 
pour `tab1`, et d'une case vers la gauche pour `tab2`.

<br>

Exemple avec taille 5 :   
- Si `vect1` contient `[1, 2, 3, 4]` et `vect2` contient aussi  `[1, 2, 3, 4]`, après l'éxécution 
de `shiftLR(vect1, vect2, 4)`, `vect1` contiendra `[4, 1, 2, 3]` et `vect2` contiendra `[2, 3, 4, 1]`.

==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#define MAX 256
==

editor.code==#|c|
void shiftLR(int a[], int b[], int size){
  // Votre code ici...
}
==

solution==#|c|
void shiftLR(int tab1[],int tab2[],int size)
{
    int val = tab1[size-1], i;
    for (i = size-1; i >=1; i--)
        tab1[i] = tab1[i-1];
    tab1[0] = val;
    val = tab2[0];
    for (i = 1; i < size; i++)
        tab2[i-1] = tab2[i];
    tab2[size-1] = val;
}
==

code_after==#|c|
int main(int argc, char* argv[]){
  int tab1[MAX],tab2[MAX];
  int lu;
  int i;
  int size;
  scanf("%i",&size);
  for (i = 0; i < size; i++) {
    scanf("%d",&lu);
    tab1[i] = lu;
  }
  for (i = 0; i < size; i++) {
    scanf("%d",&lu);
    tab2[i] = lu;
  }
  decaleDG(tab1,tab2,size);
  printf("tab1 :");
  for (i = 0; i < size; i++)
    printf(" %i",tab1[i]);
  printf("\ntab2 :");
  for (i = 0; i < size; i++)
    printf(" %i",tab2[i]);
  return 0;
}
==


checks_args_stdin==#|python|
[ ["Test basique", "","5\n 1 2 3 4 5\n 1 2 3 4 5"] ,
  ["Test croissant", "","9\n"+" ".join([str(i) for i in range(1,10)])+"\n"+" ".join([str(i) for i in range(1,10)]) ],
  ["Test aléatoire 1", "","20\n"+" ".join([str(randint(-20,20)) for i in range(20)])+"\n"+" ".join([str(randint(0,20)) for i in range(20)]) ],
  ["Test aléatoire 2", "","10\n"+" ".join([str(randint(0,50)) for i in range(10)])+"\n"+" ".join([str(randint(0,20)) for i in range(10)]) ],
]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

