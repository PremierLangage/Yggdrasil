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

title=Afficher le contenu d'un fichier

tag=fichier|programme|affichage

author=Nicolas Borie

editor.height=300px

@f1.txt
@f2.txt
@f3.txt
@f4.txt
@f5.txt

text==#|markdown|
Écrire un programme C qui prend un argument qui sera toujours le nom d'un 
fichier positionné dans le répertoire courrant et dont vous aurez les 
droits de lecture dessus. Votre programme devra ouvrir ce fichier, le 
lire et afficher le contenu lu sur la sortie standard (afficher sur 
l'écran dans le terminal avec printf par exemple...).
==

code_before==#|c|
==

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv){
  // Votre code ici 
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  FILE* f=fopen(argv[1], "r");
  char c;
  while ((c = fgetc(f)) != EOF)
    putchar(c);
  fclose(f);
  return 0;
}
==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["f1.txt"], ""] ]
==

astuces==#|python|
[
  { "content": """`int are_equal_tab(int t1[],int t2[], int size)` est un bon choix de prototype."""},
  { "content": """Une seule variable locale une bonne boucle `for` doivent suffire."""},
  { "content": """Il faut faire tourner une boucle de `0` inclus à `size` exclus et faire un test entre les deux valeurs à cet indice pour les deux tableaux. En cas de différence, on renvoie directement `0`. Si à la fin de la boucle, toutes les valeurs étaient égales deux à deux, alors il faut retourner `1`."""}
]
==

