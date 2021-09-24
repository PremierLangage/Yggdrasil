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

title=Maximum d'un tableau

tag=tableau|fonction|parcours

author=Nicolas Borie

text==#|mardown|

Ecrire une fonction `int max_tab(int t[], int taille)` qui reçoit un tableau et sa taille (>0) et renvoie son maximum ou -1 si la taille est <= 0.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
int max_tab(int tab[], int size){
  /* Votre code ici */
} 
==
solution==
int max_tab(int tab[], int size){
  if(size <= 0){
    return -1;
  }
  int max,i;
  max=tab[0];
  for(i=1;i<size;i++)
    if(tab[i]>max)
        max=tab[i];
return max;
} 
==
codeafter==

int main(int argc, char* argv[]){
  int tab[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    tab[size] = lu;
    size++;
  }
  if(size == 0){
    printf("Max d'un tableau vide : %d", max_tab(tab, size));
  }
  else{
    printf("Le maximum des entiers est %d\n", max_tab(tab, size));
  }

  return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
  ["tableau vide", "", ""],
  ["aléatoire ", ""," ".join([str(random.randint(-10,10)) for i in range(random.randint(5,20))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==
