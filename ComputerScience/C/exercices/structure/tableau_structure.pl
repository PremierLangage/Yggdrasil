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

extends=/ComputerScience/C/template/std_progC.pl

author=Elise Hardy

title=Tableau de structure
tag=structure

text==
Déclarez une énumération **Fruit** contenant les fruits *pomme*, *poire*, *banane* et *cerise*.
Puis déclarer une structure **Panier** contenant un tableau de 4 **Fruit** nommé *tab*. 

==

editor.code==#|c|
typedef ...
==

solution==#|c|
typedef enum {pomme, poire,banane,cerise}Fruit;

typedef struct {
  Fruit tab[4];
}Panier;
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
    
int main(int argc, char* argv[]){
  Panier p;
  
  p.tab[0]=p.tab[2]=pomme;
  p.tab[1]=poire;
  p.tab[3]=cerise;
  
  printf("panier: %d %d %d %d",p.tab[0],p.tab[1],p.tab[2],p.tab[3]);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Déclaration et utilisation", [],""] ] 
==


