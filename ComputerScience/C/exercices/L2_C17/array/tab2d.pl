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
Ecrire une fonction de protopype `void remplit(char tab[MAX][MAX],int li,int col)` 
qui remplit la partie effective avec des lettres minuscules consécutives.<br>
Après la lettre $%\tt{z}%$ on repart de la lettre $%\tt{a}%$ <br>
Exemples (avec MAX 50)<br>
remplit(tab,3,4) transforme les 3 premières lignes et 4 premières colonnes en   

    a b c d   
    e f g h   
    i j k l   

remplit(tab,4,10) transforme les 4 premières lignes et 10 premières colonnes en   

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
void remplit(char tab[][MAX],int li,int col){
  // Votre code ici...
}
==

solution==#|c|
void remplit(char tab[MAX][MAX],int li,int col){
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
      printf("%c",tab[i][j]);
    printf("\n");
    }
}

int main(void){
  char tab[MAX][MAX];
  int li,col;
  scanf("%d %d",&li,&col);
  remplit(tab,li,col);
  affiche(tab,li,col);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["simple éxécution", "","3 4"],
  ["aléatoire ", "",str(random.randint(4,8))+" "+str(random.randint(9,15))] ]
==



