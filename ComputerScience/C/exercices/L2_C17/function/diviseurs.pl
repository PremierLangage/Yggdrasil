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

title=Diviseurs d'un entier positif

tag=fonction|declaration|parametre|boucle

editor.height=300px

text==#|markdown|
 
Ecrire une fonction qui reçoit un entier strictement positif et affiche,
 **un par ligne**, chacun de ses diviseurs en ordre croissant.
La fonction renvoie le nombre de diviseurs.

Si l'entier est négatif ou nul, la fonction retourne -1 et ne fait aucun calcul.

<b><u>Exemple :</u></b>

Un nombre : 6

1

2

3

6

6 a 4 diviseurs
==

editor.code==#|c|
... diviseurs(...) {
  // Votre code ici...
}

==


code_before==#|c|

#include <stdlib.h>
#include <stdio.h>

==

solution==#|c|

int diviseurs(int n){
  if(n <= 0){
    return -1;
  }
  int nb=0,div;
	
	for (div = 1; div <= n; div++) {
		if (n%div == 0){
      printf("%d\n", div);
      nb++;
    }
	}
	return nb;
}

==

code_after==#|c|

int main(int argc, char const *argv[]) {
  int n = atoi(argv[1]);
  int nb=0;   
  nb=diviseurs(n);
  printf("%d a %d diviseurs\n", n, nb);
  return 0;
}
==


checks_args_stdin==#|python|
[ ["Exemple énoncé", ["6"], ""],
  ["Basique", ["10"], ""],
  ["Vide", ["0"], ""],
  ["Grand", ["100"], ""],
  ["Négatif", ["-1"], ""],
  ["Test aléatoire 1", [str(randint(1, 20))], ""],
  ["Test aléatoire 2", [str(randint(20, 40))], ""],
  ["Test aléatoire 3", [str(randint(40, 60))], ""],
  ["Test aléatoire 4", [str(randint(60, 80))], ""],
  ["Test aléatoire 5", [str(randint(80, 100))], ""] ]
==

astuces==#|python|
[
  { "content": """Une bonne boucle `for` appelant un bon modulo doit pourvoir résoudre ce problème."""},
  { "content": """La boucle `for` doit aller de `1` inclus jusque la valeur de l'argument."""},
  { "content": """Le bon test dans le `for` regarde si le reste de la division de l'argument par l'indice de boucle est nul."""},
  { "content": """N'oubliez pas d'incrémenter un compteur à chaque fois qu'un diviseur est trouvé. C'est la valeur finale de ce compteur en fin de boucle que votre fonction devra retourner."""},
]
==


