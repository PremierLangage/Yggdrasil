#*****************************************************************************
#  Copyright (C) 2019 Marc Zipstein
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

author=Marc Zipstein

title=Lancé de n dés

tag=fonction|declaration|parametre

text==#|markdown|
Écrire une fonction `lance_n_des` qui reçoit deux entiers `val` et `n` et renvoie
le nombre de façon d'obtenir `val` en faisant la somme des valeurs d'un lancé de 
`n` dés (à 6 faces)

<b><u>Exemple :</u></b>

`lance_n_des(4, 3)` renvoie `3` car (3 = 2+1+1 ou 3 = 1+2+1 ou 3 = 1+1+2)   
`lance_n_des(4, 4)` renvoie `1` (4 = 1+1+1+1)   
`lance_n_des(40, 3)` renvoie `0` (max : 6+6+6 = 18 < 40)   

==

editor.code==#|c|
... lance_n_des(... val, ... n) {
  // votre code ici...
}
==


code_before==#|c|

#include <stdlib.h>
#include <stdio.h>

==

solution==#|c|
int lance_n_des(int val, int n){
  int i, nb = 0;
  if (val <= 0)
    return 0;
  if (n == 1)
    return (val >= 1) && (val <= 6);
  for (i=1 ; i<=6 ; i++)
    nb += lance_n_des(val-i, n-1);
  return nb;
}
==

solution_zip==#|c|
int lance_n_des(int n, int k){
    int nb=0;
    int tout=0;
    int i;
    if (k<=0)
      return 0;
    if (k==1){
      if (0<n && n<7)
    	return 1;
      else
	    return 0;
    }
    for (i=1;i<=6;i++){
      nb=lance_n_des( n-i, k-1);  	
	  tout+=nb;    
    }
    return tout;
}

==




code_after==#|c|
int main(int argc, char const *argv[]) {
  int n = atoi(argv[1]);
  int nb=0;
  int k=atoi(argv[2]);
  nb=lance_n_des(n,k);
  printf("%d façons d'obtenir  %d avec %d des \n", nb, n, k);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Exemple énoncé 1", ["4", "3"], ""],
  ["Exemple énoncé 2", ["4", "4"], ""],
  ["Exemple énoncé 3", ["40", "3"], ""],
  ["Test basique", ["5", "2"], ""],
  ["Test vide", ["0", "3"], ""],
  ["Grand test", ["20", "5"], ""],
  ["Test aléatoire 1", [str(randint(1, 24)), str(randint(1, 4))], ""],
  ["Test aléatoire 2", [str(randint(2, 30)), str(randint(2, 5))], ""],
  ["Test aléatoire 3", [str(randint(3, 36)), str(randint(3, 6))], ""],
  ["Test aléatoire 4", [str(randint(3, 36)), str(randint(3, 6))], ""],
  ["Test aléatoire 5", [str(randint(3, 36)), str(randint(3, 6))], ""] ]
==

astuces==#|python|
[
  { "content": """Une manière raisonnable de résoudre ce problème est de faire une fonction récursive."""},
  { "content": """Pour un seul dé, il n'y a qu'une seule manière d'obtenir les valeurs comprises entre 1 et 6 toutes deux incluses. Toutes les autres valeurs sont impossibles à obtenir."""},
  { "content": """Pour plus de dés, selon les 6 valeurs possibles du dernier dés, il faut procéder à un appel récursif et sommer le nombre de manières à chaque fois."""}
]
==

