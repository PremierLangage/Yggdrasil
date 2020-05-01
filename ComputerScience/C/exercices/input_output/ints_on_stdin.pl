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

int main(...){	
  /** votre code ici... **/
}

==

solution==

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int n, i=0;

  while(scanf("%d", &n) == 1){
    if (n == 0)
      break;
    i++;
  }

  printf("Le programme à lu %d entiers non nuls.\n", i);
  return 0;
}

==

tests==
[["Simple test", "", "1"],
 ["Stdin vide", "", ""],
 ["Fini par zéro", "", "1 2 3 4 5 0"],
 ["Aléatoire", "", " ".join([str(random.randint(-10, 10)) for i in range(random.randint(2,6))])],
 ["Aléatoire", "", " ".join([str(random.randint(-10, 10)) for i in range(random.randint(6,20))])],
 ["Aléatoire", "", " ".join([str(random.randint(-20, 20)) for i in range(random.randint(10,20))])],
 ["Aléatoire", "", " ".join([random.choice(["Stop", "lettre", "mot45"]+[str(random.randint(-100,100)) for i in range(10)]) for i in range(random.randint(10,20))])],
 ["Aléatoire", "", " ".join([random.choice(["Stop", "lettre", "mot45"]+[str(random.randint(-100,100)) for i in range(10)]) for i in range(random.randint(10,20))])],
 ["Aléatoire", "", " ".join([random.choice(["Stop", "lettre", "mot45"]+[str(random.randint(-100,100)) for i in range(10)]) for i in range(random.randint(10,20))])]]
==




