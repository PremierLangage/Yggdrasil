#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Fonction qui affiche la date de compilation
tag=macro|function

text==
Le compilateur **gcc** possède quelques macros prédéfinies et
adaptatives. Parmi ces dernières, il y a la macro **\_\_DATE\_\_**. Cette
dernière est substituée lors de la préproccession par une chaîne de
caractère donnant la date de compilation du programme.

Écrire une fonction *print_compilation_date* qui affichera lors de son
appel la phrase suivante :

    
    Le programme à été compilé le XXXXX.

    
Il faudra remplacer XXXXX par date de compilation du programme et ne
pas oublier le point ainsi que le retour à la ligne en fin de phrase. 

==

editor.code==#|c|
... print_compilation_date(...){
  ...
}
==

solution==#|c|
void print_compilation_date(){
  printf("Le programme à été compilé le %s.\n", __DATE__);
}
==

codebefore==#|c|
#include <stdio.h>
==

codeafter==#|c|
int main(int argc, char* argv[]){
  print_compilation_date();

  return 0;
}
==

tests==
[ ["Exécution simple", "",""] ]
==

