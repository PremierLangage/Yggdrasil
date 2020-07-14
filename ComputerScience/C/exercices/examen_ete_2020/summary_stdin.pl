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
title=Résumer le contenu de l'entrée standard
tag=programm|input_output|function

text==
Écrire un programme C qui analyse son entrée standard pour en proposer un très 
rapide résumé. Quelle que soit la longueur de l'entrée standard, votre 
programme devra compter le nombre de chiffre et de mots comme il suit:

    nombres: 2
    mots: 2

On considéra les espaces, les tabulations et les retours chariots comme 
délimiteurs. Les nombres sont composés de chiffres uniquement (`[0-9]`) et 
peuvent possiblement commencer par des zéros. L'entrée standard sera 
composée uniquement de mots en lettres minuscules, de nombres ainsi que 
de délimiteurs (uniques ou multiples) les séparants.
==

editor.code==#|c|
#include ...

int main(...){
  ...
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  int nb_c=0, nb_mot=0;

  printf("nombres: %d\n", nb_c);
  printf("mots: %d\n", nb_mot);
  return 0;
}
==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Exécution simple", [], "mot 123 autremot 54"]]
==

