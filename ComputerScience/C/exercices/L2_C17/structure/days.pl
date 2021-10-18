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

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Nicolas Borie

title=Structure C pour les jours de la semaine

tag=structure|énumération

text==#|markdown|
Déclarer et définir une **structure** C nommée **Jour**. Cette structure
devra être une énumération des jours de la semaine dont les éléments
seront le nom de chaque jour en francais et tout en minuscules :
*lundi*, *mardi*, *mercredi*, ...    


==

editor.code==#|c|
typedef ...
==

solution==#|c|
typedef enum {lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche} Jour;
==

code_before==#|c|

==

code_after==#|c|
#include <stdio.h>
    
int main(int argc, char* argv[]){

  printf("Jour %d\n", lundi);
  printf("Jour %d\n", mardi);
  printf("Jour %d\n", mercredi);
  printf("Jour %d\n", jeudi);
  printf("Jour %d\n", vendredi);
  printf("Jour %d\n", samedi);
  printf("Jour %d\n", dimanche);
  
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation", [], ""] ] 
==

astuces==#|python|
[
  { "content": """C'est un exercice d'application direct du cours extrement simple. Si vous décochez cet indice, taper donc `structure enum C` dans google et lisez un ou deux articles."""}
]
==


