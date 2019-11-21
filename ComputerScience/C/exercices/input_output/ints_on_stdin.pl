# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Entiers sur l'entrée standard

author=Nicolas Borie
title=Entiers sur l'entrée standard
tag=input_output|program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme qui affiche le nombre d'entiers non nuls que l'on peut 
lire sur l'entrée standard. L'entrée standard, c'est globalement le clavier 
(là où lit la fonction **scanf** par exemple).

Votre programme devra lire, tant qu'il le peut des entiers sur l'entrée standard.
Dès qu'il n'arrive plus à lire ou bien que le programme ne lit plus des entiers, 
ou encore que l'entier lu est nul, votre programme arrêtera de lire l'entrée
standard et affichera sur la sortie standard la phrase suivante 
**Le programme à lu XX entiers non nuls.** (avec un point et un retour chariot 
à la fin de la ligne).

==

editor.code==
#include ...

int main(int argc, char* argv[]){	
  /** votre code ici... **/
}

==

solution==

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int i;
  float ans = 1.0;

  for(i=1 ; i<argc ; i++)
    ans *= atof(argv[i]);

  printf("Le produit des arguments est %f.\n", ans);
  return 0;
}

==

tests==
[["Simple test", "3.141592", ""],
 ["Pas d'argument", "", ""],
 ["6 arguments triviaux", "1.0 1.0 1 1 1.0000 1.", ""],
 ["Aléatoire", " ".join([str(10*(random.random()-0.5)) for i in range(random.randint(2,6))]), ""],
 ["Aléatoire", " ".join([str(20*(random.random()-0.5)) for i in range(random.randint(5,10))]), ""],
 ["Aléatoire", " ".join([str(100*(random.random()-0.5)) for i in range(random.randint(2,6))]), ""],
 ["Aléatoire", " ".join([str(200*(random.random()-0.5)) for i in range(random.randint(5,10))]), ""]]
==



