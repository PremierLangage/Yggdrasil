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

title=Macro chaîne depuis argument 
tag=macro|dièse|paramètre

text==

Écrire une macro **EVAL** prenant un seul paramètre qui sera une
expression C s'évaluant dans les entiers.

En imaginant que cette expression soit `12*2`, votre macro devra
afficher sur la sortie standard 
`12*2 = 24`
et **retourner à la ligne** juste derrière le dernier entier. 
Utilisez **printf** sans mettre de point virgule à la fin de votre 
macro (la macro sera toujours appelée avec un point virgule final 
dans les programmes).

<br>
    
Pour rappel, les arguments des macros ne sont pas typés. Le
préprocesseur ne fait que des inclusions et subistitutions. Lorsqu'une
macro prend un paramètre **a**, on peut obtenir une chaine de caractère C
à partir de **a** en utilisant **#a** dans le corps de la macro.
==

editor.code==#|c|
#define EVAL....
==

solution==#|c|
#define EVAL(e) printf("%s = %d\n", #e, e)
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  int a = 1;
  int b = 2;
  int c = 3; 
  
  printf("Sachant que a vaut 1, b vaut 2 et c vaut 3...\n");

  EVAL(2*a-b);
  EVAL(3*b-2*c);
  EVAL(a+b+c);
  EVAL(a*b*c);
  EVAL(153-89);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Quelques expressions", "",""] ] 
==




