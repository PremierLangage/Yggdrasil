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
int are_equal_tab(int tab[],int deu[], int size){

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

if (are_equal_tab(tab, cop, size)==1)
    printf("Tableaux identiques\n");
else
  printf("Tableaux différents\n");
if (are_equal_tab(tab, dif, size)==1)
     printf("Tableaux identiques\n");
else
  printf("Tableaux différents\n");
return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", [], "1 2 3 4 5"],
  ["Test aléatoire 1", [], " ".join([str(randint(-20,20)) for i in range(randint(5,10))])],
  ["Test aléatoire 2", [], " ".join([str(randint(-30,30)) for i in range(randint(10,15))])],
  ["Test aléatoire 3", [], " ".join([str(randint(-40,40)) for i in range(randint(15,20))])],
  ["Test aléatoire 4", [], " ".join([str(randint(-50,50)) for i in range(randint(20,25))])],
  ["Test aléatoire 5", [], " ".join([str(randint(-60,60)) for i in range(randint(25,30))])]]
==

astuces==#|python|
[
  { "content": """`int are_equal_tab(int t1[],int t2[], int size)` est un bon choix de prototype."""},
  { "content": """Une seule variable locale une bonne boucle `for` doivent suffire."""},
  { "content": """Il faut faire tourner une boucle de `0` inclus à `size` exclus et faire un test entre les deux valeurs à cet indice pour les deux tableaux. En cas de différence, on renvoie directement `0`. Si à la fin de la boucle, toutes les valeurs étaient égales deux à deux, alors il faut retourner `1`."""}
]
==
