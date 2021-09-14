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

title=Compter trois types de lettres
tag=programme|argument|terminal|affichage|type|char|chaîne

text==
Écrire un programme C qui lit son premier argument et compte les
caractères de différents types dans le premier argument donné au
programme. Il y aura trois types de caractères à compter : les lettres
minuscules, les lettres majuscules et le reste du monde. Une fois le
comptage terminé, votre programme devra faire un résumé de ce qu'il a
compté sur la sortie standard via l'affichage suivant :


    Nombre de majuscules : X   
    Nombre de minuscules : Y   
    Nombre d'autres caractères : Z   


Où X, Y et Z seront remplacés par les entiers qui vont bien. Pas besoin
d'adapter les pluriels selon les comptes trouvés. 
==

editor.code==#|c|
#include ...

int main(int argc, char* argv[]){
  /* Votre code ici... */
}
==

code_before==#|c|

==

code_after==#|c|

==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  int nb_min=0;
  int nb_maj=0;
  int nb_other=0;
  int i;

  for (i=0 ; argv[1][i] != '\0' ; i++){
    if ((argv[1][i] >= 'a') && (argv[1][i] <= 'z'))
      nb_min++;
    else if ((argv[1][i] >= 'A') && (argv[1][i] <= 'Z'))
      nb_maj++;
    else
      nb_other++;
  }
  printf("Nombre de majuscules : %d\n", nb_maj);
  printf("Nombre de minuscules : %d\n", nb_min);
  printf("Nombre d'autres caractères : %d\n", nb_other);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["mot"], ""],
  ["Un de chaque", ["a A"], ""],
  ["Chaîne vide", [""], ""],
  ["Exemple complet", ["Voici un EXEMPLE un peu PLUS long..."], ""],
  ["Test alátoire 1", ["".join([choice("abcdeABCDE ?!$*") for i in range(randint(20, 40))])], ""],
  ["Test alátoire 2", ["".join([choice("abcdeABCDE ?!$*") for i in range(randint(20, 40))])], ""],
  ["Test alátoire 3", ["".join([choice("abcdeABCDE ?!$*") for i in range(randint(20, 40))])], ""], ]
==

