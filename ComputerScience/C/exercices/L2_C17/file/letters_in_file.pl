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

title=Répartition des lettres dans un fichier

tag=fichier|fonction|occurence|caractère|type

author=Nicolas Borie

editor.height=300px


text==#|markdown|
Écrire une fonction qui prend en argument un fichier ouvert et qui fait un résumé 
des pourcentages d'occurence de chacunes des lettres minuscules parmi toutes les 
lettres minuscules. Ainsi, pour chaque lettre, il faudra calculer son pourcentage 
de présence parmi toutes les lettres.

Pour un fichier de contenu :

    aaaa eeee

Il faudra afficher :

    a: 50.00%
    e: 50.00%

On affichera seulement les lignes pour lesquelles la proportion est non nulle. Si 
toutes les lettres minuscules apparaissent, alors on affichera 26 lignes, une pour 
chacune des lettres de l'alphabet latin.


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
[ ["Ne rien écrire", ["", "0"], ""],
  ["Éxécution simple", ["Bonjour", "1"], ""],
  ["Deux fois", ["Le chocolat de Poulain est deux fois plus crémeux.", "2"], ""],
  ["Trois fois", ["Et jamais deux sans trois.", "3"], ""],
  ["Cinq fois", ["Je vous reçois 5 sur 5.", "5"], ""],
  ["Trop de fois", ["Bon, on va regarder K2000.", "154"], ""],
  ["Test aléatoire", [choice(["Pierre", "Paul", "Jacques", "Martin", "Jacky", "John", "Herbert"]), str(randint(5,15))], ""] ]
==

astuces==#|python|
[
  { "content": """La fonction peut s'écrire en 2 lignes après avoir déclaré une variable locale entière."""},
  { "content": """Il suffira de mettre une écriture sur fichier dans une boucle `for`."""},
  { "content": """`fprintf` avec le format `"%s\n"` utilisé correctement devrait vous permettre facilement de faire l'écriture sur fichier."""}
]
==


