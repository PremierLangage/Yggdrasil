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

title=Qualifier l'entrée standard
tag=clavier|entrées|sorties|difficile|entier|flottant

text==
Écrire un programme qui qualifie ce qu'il reçoit sur l'entrée standard. L'entrée 
standard ne sera pas composée de délimiteur (pas d'espace, pas de tabulation, 
seulement un retour chariot à la fin de cette dernière). Globalement, l'entrée 
standard ne sera composé que d'un gros tas de cractères avec un retour à la ligne final.

<br />

Vous devrez alors reconnaitre si l'entrée standard décrit :

  * Un nombre entier   
  * Un nombre flottant   
  * Un mot   
  * Une entrée invalide (rien des trois au dessus)   


Un nombre entier commence par un chiffre différent de zéro puis est suivi de chiffres.
Un nombre flottant a la même structure qu'un nombre entier mais doit incorporer un point
au milieu ou en fin. Un nombre flottant peut quand même commencer par un zéro seulement 
s'il est directement suivi du point. Un mot est une séquence de lettres minuscules mais peut 
commencer possiblement par une lettre majuscule. À l'exception de ces trois descriptions 
toute autre entrée sera invlide.
==

editor.height=350px

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){

}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){

}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Test basique 1", [], "Pelle\n"],
 ["Test basique 2", [], "421\n"],
 ["Test basique 3", [], "3.141592\n"],
 ["Test basique 4", [], "13baobab.234\n"]]
==


