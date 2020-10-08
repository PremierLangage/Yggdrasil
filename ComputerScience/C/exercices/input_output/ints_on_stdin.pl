#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Entiers sur l'entrée standard
tag=programme|entrées|sorties|entier

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

editor.code==#|c|
#include ...

int main(...){	
  /** votre code ici... **/
}
==

solution==#|c|
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

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
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





