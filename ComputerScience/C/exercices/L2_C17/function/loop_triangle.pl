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

author=Nicolas Borie

title=Un triangle avec des caractères ascii
tag=function|boucle|for


text==#|markdown|
Écrire une fonction **ascii_triangle** qui prend en argument un entier
et affiche un triangle avec des caractères étoile \* comme dans les
exemples qui suivent :

Pour n = 3, on devra voir

    *
    **
    ***    

Pour n = 5, on devra voir

    *
    **
    ***
    ****
    *****    


==

editor.code==#|c|
#include <stdio.h>
    
... ascii_triangle(...){
  ...
}
==

solution==#|c|

#include <stdio.h>
    
void ascii_triangle(int n){
  int i, j;

  for(i=1 ; i<=n ; i++){
    for(j=0 ; j<i ; j++)
      printf("*");
    printf("\n");
  }  
}

==

code_after==#|c|

#include <stdlib.h>
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);

  ascii_triangle(a);
  return 0;
}
==

code_before==#|c|

==

checks_args_stdin==#|python|
[ ["Test basique", ["3"], ""],
  ["Test moyen", ["6"], ""],
  ["Test vide", ["0"], ""],
  ["Test aléatoire 1", [str(randint(5, 10))], ""],
  ["Test aléatoire 2", [str(randint(11, 15))], ""] ]    
==


astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==



