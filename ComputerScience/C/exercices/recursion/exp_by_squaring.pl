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

title=Exponentiation rapide en récursif
tag=fonction|recursion|arithmetique

text==
Écrire une fonction récursive **exp_rap** qui prend en paramètre deux
entiers $%a%$ et $%n%$ puis retourne $%a^n%$. Utilisez l'algorithme de
l'exponentiation rapide.

 * Pour $%n = 0%$, on a $%a^0 = 1%$ (on considéra que $%0^0 = 1%$ comme tout bon
algébriste).

 * Si $%n%$ est un entier pair $%n = 2q%$, il suffira de mettre au carré le retour de l'appel récursif calculant $%a^q%$.
 
 * Si $%n%$ est entier impair $%n = 2q + 1%$, il faudra mettre au carré de retour de l'appel récurif donnant $%a^q%$ mais aussi le multiplié une dernière fois par $%a%$.
==

editor.code==
... exp_rap(...){
...
}
==

solution==

int exp_rap(int a, int n){
  int partial; 
  if (n <= 0)
    return 1;
  partial = exp_rap(a, n/2);
  if ((n%2))
    return partial*partial*a;
  return partial*partial;
}
    


==
    
codeafter==

#include <stdlib.h>
#include <stdio.h>    
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int n = atoi(argv[2]);    
  printf("%d puissance %d : %d\n", a, n, exp_rap(a, n));
  return 0;
}

==

    
tests==

[["Basique", "1 1", ""], 
 ["Moyen", "12342312 0", ""],
 ["Négatif", "-2 5", ""],
 ["Aléatoire", ' '.join([str(random.randint(-5, 5)), str(random.randint(1, 5))]), ""],
 ["Aléatoire", ' '.join([str(random.randint(-6, 6)), str(random.randint(1, 6))]), ""],
 ["Aléatoire", ' '.join([str(random.randint(-7, 7)), str(random.randint(1, 7))]), ""],
 ["Aléatoire", ' '.join([str(random.randint(-8, 8)), str(random.randint(1, 8))]), ""]]

==



