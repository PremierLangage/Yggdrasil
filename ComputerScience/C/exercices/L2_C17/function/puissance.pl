#*****************************************************************************
#  Copyright (C) 2017 Elise Hardy <ehardy@etud.u-pem.fr>
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

author=Elise Hardy

title=Écrire une fonction qui calcule la puissance d'un nombre
tag=function|arithmetique|puissance


text==#|markdown|
Écrire une function **puissance** qui prend en argument 2 entiers $%n%$ et 
$%p%$ et qui retourne l'entier $%n^p%$.


Si l'exposant est nul alors la fonction devra retourner 1.    
Si l'exposant $%p%$ est strictement négatif alors la fonction doit retourner 0.
==

editor.code==#|c|
... puissance (...){
  // Votre code ici...
}
==

solution==#|c|
int puissance (int n, int p){
	if(p < 0){
		return 0;
	}
	int i;
	int puis=1;
	for(i=0;i<p;i++){
		puis*=n;
	}
	return puis;
}

==

code_before==

==

code_after==#|c|

#include <stdio.h>
#include <stdlib.h>    
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf("%d\n", puissance(a, b));
  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["2", "5"], ""],
 ["Exposant impossible", ["8", "-4"], ""],
 ["Test aléatoire 1", [str(randint(-6, 11)) for i in range(2)], ""],
 ["Test aléatoire 2", [str(randint(-6, 11)) for i in range(2)], ""],
 ["Test aléatoire 3", [str(randint(-6, 11)) for i in range(2)], ""],
 ["Test aléatoire 4", [str(randint(-6, 11)) for i in range(2)], ""],
 ["Test aléatoire 5", [str(randint(-6, 11)) for i in range(2)], ""],
 ["Test aléatoire 6", [str(randint(-6, 11)) for i in range(2)], ""]]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
]
==

