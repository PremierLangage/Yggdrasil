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

title=Tableau de caractères à deux dimensions

tag=tableau|fonction|rectangle|matrice

author=Prog C L2 Team

text==#|markdown|
Écrire une fonction de protopype `void remplir(char tab[MAX][MAX], int li, int col)` 
qui remplit la partie effective (de taille `li x col`) de la matrice `tab` avec des lettres 
minuscules consécutives. La méthode de remplissage va de ligne en ligne de la gauche 
vers la droite et aussi de haut en bas. Après la lettre `z` atteinte, on repart de la lettre `a`   

<br>

<u>Exemples :</u> (avec `#define MAX 50` pour information)   
`remplir(tab, 3, 4)` transforme les `3` premières lignes et `4` premières colonnes de `tab` en   

    a b c d   
    e f g h   
    i j k l   

`remplir(tab, 4, 10)` transforme les `4` premières lignes et `10` premières colonnes de `tab` en   

    a b c d e f g h i j   
    k l m n o p q r s t   
    u v w x y z a b c d   
    e f g h i j k l m n   
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>

#define MAX 50
==

editor.code==#|c|
void remplir(char tab[MAX][MAX], int li, int col){
  // Votre code ici...
}
==

solution==#|c|
void remplir(char tab[MAX][MAX],int li,int col){
  char l='a';
  int d=0;
  int i,j;
  for(i= 0;i<li;i++)
    for(j=0;j<col;j++){
      tab[i][j]=l;
      d=(d+1)%26;
      l='a'+d;
    }
}
==

code_after==#|c|
void affiche (char tab[][MAX],int li,int col){
  int i,j;
  for(i= 0;i<li;i++){
    for(j=0;j<col;j++)
      printf("%c ",tab[i][j]);
    printf("\n");
    }
}

int main(void){
  char tab[MAX][MAX];
  int li,col;
  scanf("%d %d",&li,&col);
  remplir(tab,li,col);
  affiche(tab,li,col);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", "","3 4"],
  ["Test aléatoire 1", "",str(randint(3, 6))+" "+str(randint(5,10))],
  ["Test aléatoire 2", "",str(randint(3, 6))+" "+str(randint(10,20))],
  ["Test aléatoire 3", "",str(randint(4, 8))+" "+str(randint(10,20))],
  ["Test aléatoire 4", "",str(randint(3, 6))+" "+str(randint(20,35))],
  ["Test aléatoire 5", "",str(randint(5, 10))+" "+str(randint(20,35))] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

