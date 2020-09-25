
# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
author=

title=Appeler les fonctions qui vont bien...
tag=program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction *cube* qui prend en argument un entier *n* (par exemple 3) et qui affiche 
une phrase donnant le cube de cet entier tout en rappelant cet entier (par exemple Le cube du nombre 
3 est le nombre 27).<br>
 0n ecrira une fonction **affiche_info** affichant la phrase et une fonction **calcule_cube**
effectuant le calcul
==

editor.code==

void affiche_info(int /*var1*/, int /*var2*/){
  printf("Le cube du nombre %d est le nombre %d.\n",
    /*printf à compléter*/);
}

int calcule_cube(int nb){
  return /* À compléter*/;
}

void cube(int n){
  /* Votre code ici... */
}

==

solution==

void affiche_info(int nb, int cube){
  printf("Le cube du nombre %d est le nombre %d.\n", nb, cube);
}

int calcule_cube(int nb){
  return nb*nb*nb;
}

void cube(int n){
  affiche_info(n, calcule_cube(n));
}

==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

codeafter==

int main(int argc, char* argv[]){
  cube(atoi(argv[1]));

  return 0;
}

==

tests==
[["Exécution simple", "1", ""],
 ["Quelques éléments", "12", ""],
 ["Un négatif", "-7", ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""],
 ["Aléatoire", str(random.randint(-100, 100)), ""]]
==






