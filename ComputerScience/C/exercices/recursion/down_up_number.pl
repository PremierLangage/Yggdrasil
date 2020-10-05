#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Égrener des nombres récursivements
tag=function|recursion

text==
Écrire une fonction récurssive **bas_haut** qui prend en argument un
entier *n* et qui affiche sur une seule ligne sans retour à la ligne
tout les entiers de *n* à *1* puis remonte à *n*. Chaque monbre sera
séparé par un espace.

Pour *n* qui vaut *7*, cela donnera

    7 6 5 4 3 2 1 2 3 4 5 6 7 


==

editor.code==#|c|
#include <stdio.h>

... bas_haut(...){
  ...
}
==

solution==#|c|
#include <stdio.h>
    
void bas_haut(int n){
  if (n < 1)
    return ;	
  if (n == 1)
    printf("1");
  else{
    printf("%d ", n);
    bas_haut(n - 1);
    printf(" %d", n);
  }	
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdlib.h>

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);

  bas_haut(a);
  return 0;
}
==

checks_args_stdin==#|python|
[["Basique", ["1"], ""], 
 ["Moyen", ["5"], ""],
 ["Erreur", ["-2"], ""],
 ["Aléatoire", [str(random.randint(6, 15))], ""],
 ["Aléatoire", [str(random.randint(6, 15))], ""]]
==


