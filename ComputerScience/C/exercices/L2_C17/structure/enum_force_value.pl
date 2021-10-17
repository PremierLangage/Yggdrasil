#*****************************************************************************
#  Copyright (C) 2017 Elise Hardy <ehardy@etud.u-pem.fr>
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Elise Hardy

title=Énumeration avec des valeurs précises
tag=structure

text==
Déclarez une énumeration **Note** contenant *Mathieu*, *Cassandre*, *Laura*, *Thomas*, 
*Aurelie*, *Adrien* dont les valeurs respectifs sont `8`, `9`, `13`, `15`, `16`, `19`
Par exemple si on affiche la valeur en décimal de *Adrien*, alors l'affichage sera `19`.
==

editor.code==#|c|
typedef ...

==

solution==#|c|
typedef enum {Mathieu=8, Cassandre, Laura=13, Thomas=15, Aurelie, Adrien=19} Note;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>

int main(){
  
  printf("note: (Mathieu,%d), (Cassandre,%d), (Laura,%d), (Thomas,%d), (Aurélie,%d), (Adrien,%d)", Mathieu, Cassandre, Laura, Thomas, Aurelie, Adrien);
  return 0;}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation", [], ""] ] 
==

astuces==#|python|
[
  { "content": """C'est un exercice d'application direct du cours extrement simple. Si vous décochez cet indice, taper donc `structure enum C` dans google et lisez un ou deux articles."""},
  { "content": """Par default, le premier symbole d'une `enum` vaut 0. Par default, un symbole dans une énumération vaut la valeur du précédant plus 1. Si on écrit `symbol=23`, on force le `symbol` de l'`enum` à valoir `23`."""}
]
==
