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

title=Comparaison de deux tableaux

tag=tableau|fonction|declaration|parcours

author=Prog C L2 Team

text==#|markdown|
Écrire une fonction `are_equal_tab` qui prend en argument 3 paramètres. Les deux premiers
arguments seront des tableaux d'entiers, le dernier argument sera un entier qui donnera
la taille des deux tableaux. L'utilisateur d'une telle fonction sera responsable de 
tourjours bien forunir des arguments corrects, c'est son travail de toujours
bien donner deux tableaux de même taille à votre fonction.

Finalement, votre fonction devra renvoyer `1` si les contenus des deux tableaux sont 
identiques et `0` sinon.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include<time.h>
==

editor.code==#|c|
int are_equal_tab(...){
  // Votre code ici
}
==

solution==#|c|
int identique_tab(int tab[],int deu[], int size){

  int i;

  for(i=0 ; i<size ; i++){
    if( deu[i]!=tab[i])
        return 0;
  }
  return 1;
}
==

code_after==#|c|
int main(int argc, char* argv[]){
  int tab[100],cop[100],dif[100];
  int size = 0;
  int lu;

  while (scanf("%d", &lu) == 1){
    dif[size]=cop[size]=tab[size] = lu;
   size++;
  }
  dif[size-1]=tab[size-1]+1+(rand()%100);

if (identique_tab(tab,cop,size)==1)
    printf(" tableaux identiques \n");
else
  printf("tableaux différents \n");
if (identique_tab(tab,dif,size)==1)
     printf(" tableaux identiques \n");
else
  printf("tableaux différents \n");
return 0;
}
==

checks_args_stdin==#|python|
[ ["simple éxécution", "","1 2 3 4 5"],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==
