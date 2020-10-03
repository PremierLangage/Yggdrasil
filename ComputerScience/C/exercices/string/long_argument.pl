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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Trouver le plus long argument d'un programme C
tag=string|programme|chaine|argument|longueur


text==

Écrire un programme C qui identifie et affiche son argument le plus long. 
Une fois ce dernier identifié, il suffit de l'afficher sur la sortie standard 
**sans oublier d'aller à la ligne après l'affichage**. Si plusieurs arguments
possèdent la taille maximale, il faudra alors afficher le premier parmi les 
plus grands.

==

editor.code==#|c|
#include ...

int main(...){
  ...
}

==

solution==#|c|

#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]){
  int i, ind_max=1;

  if(argc == 1)
    return 0;

  for(i=2 ; i<argc ; i++){
    if(strlen(argv[i]) > strlen(argv[ind_max]))
      ind_max = i;
  }

  printf("%s\n", argv[ind_max]);
    
  return 0;
}

==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Test basique", ["argument1"], ""],
  ["Sans argument", [""], ""],
	["Arguments multiples", ["12", "pouet", "foo", "bar", "1367235342534"], ""],
	["Arguments longs", ["argument1", "mot", "super", "long", "anti-constitutionnellement"], ""],
	["Argument complexe", ["argument en plusieurs mots", "mot_unique"], ""],
  ["Test aléatoire 1", ["".join([chr(randint(97,122)) for i in range(randint(1,15))]) for i in range(1, 8)], ""],
  ["Test aléatoire 2", ["".join([chr(randint(97,122)) for i in range(randint(1,15))]) for i in range(1, 8)], ""],
  ["Test aléatoire 3", ["".join([chr(randint(97,122)) for i in range(randint(1,15))]) for i in range(1, 8)], ""],
  ["Test aléatoire 4", ["".join([chr(randint(97,122)) for i in range(randint(1,15))]) for i in range(1, 8)], ""],
  ["Test aléatoire 5", ["".join([chr(randint(97,122)) for i in range(randint(1,15))]) for i in range(1, 8)], ""] ]
==



