# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
author=Nicolas Borie

title=Appeler les fonctions qui vont bien...
tag=program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction *show_cube* qui prend en argument un entier *n* (par exemple 3) et qui affiche 
une phrase donnant le cube de cet entier tout en rappelant cet entier (par exemple Le cube du nombre 
3 est le nombre 9.)
==

editor.code==
void display_info(int nb, int cube){
  printf("Le cube du nombre %d est le nombre %d.\n", nb, cube);
}

int calculate_cube(int nb){
  return nb*nb*nb;
}

void show_cube(int n){
  /* Votre code ici... */
}
==

solution==
void display_info(int nb, int cube){
  printf("Le cube du nombre %d est le nombre %d.\n", nb, cube);
}

int calculate_cube(int nb){
  return nb*nb*nb;
}

void show_cube(int n){
  display_info(n, calculate_cube(n));
}
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
==

codeafter==

int main(int argc, char* argv[]){
  show_cube(argv[1]);

  return 0;
}
==

tests==
[["Exécution simple", "1", ""],
 ["Quelques éléments", "12", ""],
 ["Un négatif", "", "-7"],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""]]
==

