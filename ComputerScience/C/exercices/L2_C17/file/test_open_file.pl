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

title=Tester des ouvertures de fichiers

tag=fichier|programme|lignes|ouverture

author=Nicolas Borie

editor.height=300px

@f1.txt
@f2.txt
@f3.txt
@f4.txt
@f5.txt

text==#|markdown|
Écrire un programme C dont les arguments seront des noms de fichiers potentiellement
situé dans le répertoire courant de travail. le but de cet exercice est de tenter


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
  int c;
  int nb_ligne=0;
  while ((c = fgetc(f)) != EOF)
    if (c == '\n')
      nb_ligne++;
  fclose(f);
  printf("Nombre de lignes du fichier : %d\n", nb_ligne);
  return 0;
}
==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["f1.txt"], ""],
  ["Test aléatoire 1", [choice(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt"])], ""],
  ["Test aléatoire 2", [choice(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt"])], ""],
  ["Test aléatoire 3", [choice(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt"])], ""] ]
==

astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF. Il y a autant de ligne que de retour à la ligne."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc` et `fclose`. Trois variables locales peuvent suffire : un entier pour stocker le caractère, un entier pour accumuler le nombre d'occuence de '\n' et une variable de type `FILE*`."""}
]
==



