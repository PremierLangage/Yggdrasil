#*****************************************************************************
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

author=Nicolas Borie
title=Arguments court et long d'un programme C
tag=input_output|program

editor.height=300px

text==
Écrire un programme C qui regarde tous ses arguments et finit par afficher le 
plus court de ses arguments et ensuite le plus long. Votre programme devra 
suivre la mise en page qui suit.
    Platon@debian~$> ./a.out arg1 argum2 argument3 a4
    plus court argument: a4
    plus long argument: argument3
le nom du programme (ici ./a.out) n'est pas considérer comme un argument.
==

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){	
  /* votre code ici... */
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
