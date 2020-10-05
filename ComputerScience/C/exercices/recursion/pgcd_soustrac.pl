#*****************************************************************************
#  Copyright (C) 2018 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=PGCD avec soustractions
tag=fonction|recursion|pgcd|arithmétique

text==
Pour calculer un PGCD, on utilise habituellement l'algorithme
d'Euclide. Ce dernier est basé sur une bonne utilisation de divisions
euclidiennes itérées. Il est toutefois possible de calculer le Plus
Grand Diviseur Commun de deux entiers $% a %$ et $% b %$ de manière récursive
en ne faisant que des soutractions, des divisions par $% 2 %$ et des
multiplications par $% 2 %$.


Voici l'idée de l'algorithme (ce sont juste quelques arguments mathématiques en fait...):


Le PCGD de deux entiers $% a %$ et $% b %$ est égal :

* à $% a %$ si $% a = b %$.
    
* à $% 1 %$ si $% a %$ ou $% b %$ vaut $% 1 %$.    

* à $% 2 %$ fois le PGCD de $% \frac{a}{2} %$ et $% \frac{b}{2} %$ si
$% a %$ et $% b %$ sont tous les deux pairs.

* au PGCD de $% \frac{a}{2} %$ et $% b %$ si seulement $% a %$ est pair.

* au PGCD de $% a %$ et $% \frac{b}{2} %$ si seulement $% b %$ est pair.

* enfin, dans ce dernier cas $% a %$ et $% b %$ sont forcément impairs et distincts

    * au PGCD de $% a - b %$ et $% b %$ si $% a > b %$.

    * au PGCD de $% a %$ et $% b - a %$ si $% b > a %$.
==

editor.code==#|c|
int pgcd(int a, int b){
  ...
}
==

solution==#|c|
int pgcd(int a, int b){
  if (a == b)
    return a;
  if ((a == 1) || (b == 1))
    return 1;
  if (!(a%2) && !(b%2))
    return 2*pgcd(a/2, b/2);
  if (!(a%2))
    return pgcd(a/2, b);
  if (!(b%2))
    return pgcd(a, b/2);
  if (a > b)
    return pgcd(a-b, b);
  return pgcd(a, b-a);
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf("Le PGCD de %d et %d est : %d\n", a, b, pgcd(a,b));
    
  return 0;
}
==

checks_args_stdin==#|python|
[["Test basique", ["3", "6"], ""],
 ["Premier entre eux", ["120", "11"], ""],
 ["Test aléatoire 1", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 2", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 3", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 4", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 5", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 6", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 7", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 8", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 9", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 10", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 11", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ],
 ["Test aléatoire 12", [str(randint(1, 1000000)), str(randint(1, 1000000))], "" ]]
==



