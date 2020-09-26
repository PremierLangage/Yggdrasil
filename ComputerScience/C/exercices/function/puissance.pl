#*****************************************************************************
#  Copyright (C) 2017 Elise Hardy <ehardy@etud.u-pem.fr>
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Elise Hardy

title=Écrire une fonction qui calcule la puissance d'un nombre
tag=function|arithmetique|puissance


text==
Écrire une function **puissance** qui prend en argument 2 entiers $%n%$ et 
$%p%$ et qui retourne l'entier $%n^p%$.


Si l'exposant est nul alors la fonction devra retourner 1. Si l'exposant 
$%p%$ est strictement négatif alors la fonction doit retourner 0.
==

editor.code==
... puissance (...){
  /* Votre code ici... */
}
==

solution==
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

code_after==

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
[["Basique", ["2", "5"], ""],
 ["Impossible", ["8", "-4"], ""],
 ["Aléatoire", [str(randint(-5, 10)) for i in range(2)], ""],
 ["Aléatoire", [str(randint(-5, 10)) for i in range(2)], ""],
 ["Aléatoire", [str(randint(-5, 10)) for i in range(2)], ""],
 ["Aléatoire", [str(randint(-5, 10)) for i in range(2)], ""]]
==


