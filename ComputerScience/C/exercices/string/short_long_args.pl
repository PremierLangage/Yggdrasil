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
tag=input_output|program|string|argument

editor.height=300px

text==
Écrire un programme C qui inspecte tous ses arguments et finit par afficher le 
plus court de ses arguments et ensuite le plus long. Votre programme devra 
suivre la mise en page qui suit.

    Platon@debian~$> ./a.out arg1 argum2 argument3 a4
    plus court argument: a4
    plus long argument: argument3

le nom du programme (ici ./a.out) ne sera pas considéré comme un argument. 
Le programme sera toujours appelé avec au moins 1 argument minimum. Si 
plusieurs arguments sont de taille minimale ou maximale, votre programme 
devra choisir systématiquement les premiers des arguments disponibles (le 
premier parmi les plus petits et/ou le premier parmi les plus longs).
==

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){	
  /* votre code ici... */
}
==

solution==#|c|
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]){
  int i;
  int ind_min=1;
  int ind_max=1;

  for (i=1 ; i<argc ; i++){
      if (strlen(argv[i]) < strlen(argv[ind_min]))
        ind_min=i;
      if (strlen(argv[i]) > strlen(argv[ind_max]))
        ind_max=i;
  }

  printf("plus court argument: %s\nplus long argument: %s\n", argv[ind_min], argv[ind_max]);
  return 0;
}
==

code_after==

==

checks_args_stdin==#|python|
[["Test en exemple", ["arg1", "argum2", "argument3", "a4"], ""],
 ["Un seul argument", ["unique"], ""],
 ["Test aléatoire 1", ["".join([chr(randint(97,122)) for j in range(randint(1, 20))] ) for i in range(2, 10)], ""],
 ["Test aléatoire 2", ["".join([chr(randint(97,122)) for j in range(randint(1, 20))] ) for i in range(2, 10)], ""],
 ["Test aléatoire 3", ["".join([chr(randint(97,122)) for j in range(randint(1, 20))] ) for i in range(2, 10)], ""],
 ["Test aléatoire 4", ["".join([chr(randint(97,122)) for j in range(randint(1, 20))] ) for i in range(2, 10)], ""],
 ["Test aléatoire 5", ["".join([chr(randint(97,122)) for j in range(randint(1, 20))] ) for i in range(2, 10)], ""]]
==

