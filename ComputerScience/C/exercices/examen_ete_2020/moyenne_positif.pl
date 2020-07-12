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
title=Moyenne des éléments positifs
tag=function|array|type

editor.height=300px

text==
Écrire une fonction C **mean_positive** qui prend en argument un tableau d'entiers 
**array** ainsi que sa taille **size**. Votre fonction devra retourner la moyenne
des éléments positifs ou nuls contenus dans le tableau. Cette moyenne devra être
calculée et retournée dans les floattants C. Si le tableau ne contient aucun 
élément positifs ou nuls, votre fonction devra alors retourner zéro (dans les 
flottants encore).
==

editor.code==#|c|
... mean_positive(int* array, int size){
  /* Votre code ici... */
}
==

code.before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code.after==#|c|
int main(int argc, char* argv[]){

  return 0;
}
==
