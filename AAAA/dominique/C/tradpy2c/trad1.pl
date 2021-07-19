
#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends= /ComputerScience/C/template/modelProgC2021.pl

author=Nicolas Borie & Dominique Revuz

title=Moyenne des éléments d'un tableau
tag=array|fonction|parcours|simple

fname=a

extends= namelist.pl

before==
with open(fname+".py","r") as fpy:
    editor1.code = fpy.read()

with open(fname+".c","r") as fsolo:
    solution = fsolo.read()

with open(fname+"_testcode.c","r") as ftst:
    code_after = ftst.read()


==


text==
Écrire une fonction C **solution** est une traduction de la fonction python suivante

==

editor.code ==
/* Votre traduction en C dans cet éditeur */
==


Xsolution==#|c|
int f(int u){
return u*3;
}
==

code_before==
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int i=0;

  for (i=0 ; i<nb_term ; i++){
    printf("%d\n", f(atoi(argv[i+1])));
  }

  return 0;
}

==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Quelques éléments", ["12", "-3", "52", "0", "41"], ""],
 ["Tableau vide", [], ""],
 ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
 ]
==

