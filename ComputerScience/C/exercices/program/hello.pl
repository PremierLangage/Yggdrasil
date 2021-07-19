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
title=Premier programme en C
tag=programme|simple|printf|affichage

text==

Faites votre premier programme C, ce programme devra écrire

**Hello World!**

sur la sortie standard et retourner à la ligne. Le retour à la ligne 
est encodé par le caractère '\n' en C.

<br />

Pour faire de l'affichage, on utilise la fonction **printf**
dont l'existance est déclarée dans les headers de la 
bibliothèque standard. C'est ainsi grace à la commande
**#include <stdio.h>** que l'on a le droit d'appeler la
fonction **printf** dans la suite du programme.

<br />

Un programme C contient toujours une et une seule fonction
dont le nom est **main**. Cette fonction est le point d'entrée
du programme lors de l'exécution. Un programme C opère exactement 
tout se qui se trouve dans sa fonction **main**, ni plus, ni moins. 
Ici, il vous faut juste faire de l'affichage. Un bon appel à la
fonction **printf** doit suffire.

<br />
==

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  /* votre code ici... */
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  printf("Hello World!\n");

  return 0;
}
==

code_before==
==

code_after==
==

checks_args_stdin==#|python|
[ ["Simple éxécution", [],""],
  ["Autre éxécution", ["avec", "des", "arguments", "inutiles"],""] ]
==

astuces==

==

