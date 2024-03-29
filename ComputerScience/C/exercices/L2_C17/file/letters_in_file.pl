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

@f1.txt
@f2.txt
@f3.txt
@f4.txt
@f5.txt
@f6.txt
@titi
@toto

text==#|markdown|
Écrire une fonction qui prend en argument un fichier ouvert et qui fait un résumé 
des pourcentages d'occurence de chacunes des lettres **minuscules** parmi toutes les 
lettres **minuscules**. Ainsi, pour chaque lettre, il faudra calculer son pourcentage 
de présence parmi toutes les lettres.

Pour un fichier de contenu :

    aaaa eeee

Il faudra afficher :

    a: 50.00%
    e: 50.00%

Pour faire un affichage formaté propre, utiliser `printf` avec le format suivant :
`"%c: %5.2f%%\n"` (le floatant est sur 5 colonnes avec 2 chiffres après la virgule.)

On affichera seulement les lignes pour lesquelles la proportion est non nulle. Si 
toutes les lettres minuscules apparaissent, alors on affichera 26 lignes, une pour 
chacune des lettres de l'alphabet latin.

==

code_before==#|c|
#include <stdlib.h>
==

editor.code==#|c|
#include <stdio.h>

void letter_file(FILE* f){
  // Votre code ici...
}
==

solution==#|c|
#include <stdio.h>

void letter_file(FILE* f){
  int occ[26] = {0};
  int c;
  int tot=0;

  while ((c = fgetc(f)) != EOF){
    if (c >= 'a' && c <= 'z'){
      occ[c-'a']++;
      tot++;
    }
  }
  for (c='a' ; c<='z' ; c++){
    if (occ[c-'a'])
      printf("%c: %5.2f%%\n", c, (float)((100.0*occ[c-'a'])/tot));
  }
}
==

code_after==#|c|
int main(int argc, char* argv[]){
  FILE* f = fopen(argv[1], "r");
  letter_file(f);
  fclose(f);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["f1.txt"], ""],
  ["Fichier vide", ["f3.txt"], ""],
  ["Test aléatoire 1", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""],
  ["Test aléatoire 2", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""],
  ["Test aléatoire 3", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""] ]
==

astuces==#|python|
[
  { "content": """Pour stocker l'information sur les occurences, il faut une variable locale de type tableau d'entier de taille 26 au minimum dont les cases seront initialisées à zéro."""},
  { "content": """Le plus simple est ensuite de lire le fichier char par char et lorsque le char lu est une lettre minuscule (donc `>= 'a'` et `<= 'z'`), il faut mettre a jour une valeur du tableau des occurences ainsi que rajouter 1 sur le nombre total de lettres minuscules lues."""},
  { "content": """L'affichage final doit se faire avec `printf("%c: %5.2f%%\n", ...);` sinon vous n'afficherez pas exactement ce qui sera attendu. Cet affichage devra être dans une boucle `for` (qui pourra aller de `'a'` à `'z'`) où l'afficage est déclanché seulement si on a lu au moins une occurence de la lettre."""}
]
==


