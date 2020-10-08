#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Somme de deux entiers données au clavier
tag=input_output|simple|clavier|entrées|sorties|entier

text==
Compléter le programme suivant pour qu'il récupère deux entiers entrés
au clavier sur l'entrée standard. Ces deux entiers seront stockés dans
les variables de type entier (*int*) **a** et **b**.

Imaginons que l'utilisateur qui va tester votre programme donne les
deux entiers 12 et 3. Une fois ces deux entiers collectés, afficher la
phrase **La somme de 12 et 3 est 15.**. N'oubliez pas de retourner à
la ligne à la fin de la phrase. Votre programme devra fonctionner
quelque soit les entiers données par le testeur et pas seulement 12 et
3.
    
==

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){
  int a, b;
	
  /** ...votre code ici... **/
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  int a, b;

  scanf("%d %d", &a, &b);
  printf("La somme de %d et %d est %d.\n", a, b, a+b);
  return 0;
}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Simple test", [], "12 3\n"],
 ["Avec un négatif", [], "-12 41\n"],
 ["La tête à toto", [], "0 0\n"],
 ["D'autres négatifs", [], "-421 -12623\n"],
 ["Test aléatoire 1", [], str(randint(-10,10))+" "+str(randint(-10,10))+"\n"],
 ["Test aléatoire 2", [], str(randint(-10,10))+" "+str(randint(-10,10))+"\n"],
 ["Test aléatoire 3", [], str(randint(-10,10))+" "+str(randint(-10,10))+"\n"],
 ["Test aléatoire 4", [], str(randint(-10,10))+" "+str(randint(-10,10))+"\n"]]
==




