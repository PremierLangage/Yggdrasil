

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


#author=Marc Zipstein
title=odage d'un arbre de Huffman
tag=recherche

editor.height=300px

text== 
On FOR
Ecrire une fonction **pluslong** qui reçoit un arbre et renvoie la longueur du pluslong mot.

==

editor.code==#|c|

==

solution==#|c|


==



code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct noeud{
  char lettre;
*filsg;
 *frered;
}Noeud,*Arbre;
}
==

code_after==#|c|

==



checks_args_stdin==#|python|
	[["Arbre feuille","","a"],
	 ["arbre à 3 mots","","le la les "],
   ["arbre aléatoire","","un une du de des"+" "+choice(['dune',"deux","le","route","un","une"])]
	]
==