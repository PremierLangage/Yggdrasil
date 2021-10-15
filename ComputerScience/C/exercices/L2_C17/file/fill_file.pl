
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

title=Écriture dans un fichier

tag=fichier|programme|boucle|écriture

author=Nicolas Borie

editor.height=300px


text==#|markdown|



==

code_before==#|c|
#include <stdlib.h>
==

editor.code==#|c|
#include <stdio.h>

void fill_file(FILE* f, char* s, int times){
  // Votre code ici...
}
==

solution==#|c|
#include <stdio.h>

void fill_file(FILE* f, char* s, int times){
  int i;

  for (i=0 ; i<times ; i++)
    fprintf(f, "%s\n", s);
}
==

code_after==#|c|
int main(int argc, char* argv[]){
  int c;
  FILE* f = fopen("pouet", "w");
  fill_file(f, argv[1], atoi(argv[2]));
  fclose(f);
  f = fopen("pouet", "r");
  while ((c = fgetc(f)) != EOF)
    putchar(c);
  fclose(f);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution 1", ["", 0], ""],
  ["Simple éxécution 2", ["Bonjour", 1], ""], ]
==

astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier mot par mot tant que `fscnaf(fichier_ouvert, " %s", ...) == 1` (ce qui signifie tant que l'on lit un mot valide)."""},
  { "content": """Il faut utiliser `strlen` et `strcpy` de `<string.h>` ainsi que deux variables locales de types `char[MAX]`. Une des deux chaînes stockera le mot courrant lu et l'autre sauvegardera le mot de longueur maximal."""}
]
==

