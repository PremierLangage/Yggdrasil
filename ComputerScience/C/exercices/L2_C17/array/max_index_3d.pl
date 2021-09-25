#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Emplacement du maximum dans un tableau à trois dimensions

tag=tableau|fonction|parcours|complexe|dimension|pointeur

author=Prog C L2 Team

text==#|mardown|

==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

editor.code==#|c|
{
  // Votre code ici
} 
==

solution==#|c|
 
==

code_after==#|c|

int main(int argc, char* argv[]){

  return 0;
}
==


checks_args_stdin==#|python|
[ ["Simple éxécution", ["2", "2", "2"],""] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

