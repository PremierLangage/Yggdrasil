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

title=Plus long mot d'un fichier

tag=fichier|programme|affichage|mot|chaine

author=Nicolas Borie

editor.height=300px

@f1.txt
@f2.txt
@f3.txt
@f4.txt
@f5.txt

text==#|markdown|
Écrire un programme C qui prend un argument qui sera toujours le nom d'un 
fichier positionné dans le répertoire courrant et sur dont vous aurez les 
droits de lecture. Votre programme afficher le mot le plus long contenu dans 
le fichier. Si plusieurs mots sont de longueur maximal, on affichera le 
premier mot du fichier ayant cette longueur.

Par soucis de simplicité, on respectera les démiliteurs du langage C. Un mot 
sera donc une séquence de caractères encadré par des démiliteurs (espace, tabulation 
et retour chariot).

    Voici un exemple de contenu de fichier, c'est cool hein !

Dans l'exemple au dessus, on par exemple le mot `fichier,` (avec la virgule) 
ou bien le mot `c'est` qui est encadré par deux espaces. Cette simplification 
suit les capacités de lecture de `fscanf(" %s", ...)` qui découpe la lecture 
exactement comme décrit au dessus. Tous les mots apparaissants dans les fichiers 
ne comporteront jamais plus de 255 caractères.

Votre programme devra juste afficher le mot le plus long, tout seul sur une ligne 
(donc avec un retour chariot final) mais sans espace superflu.


==

code_before==#|c|
==

editor.code==#|c|
#include <stdio.h>
#include <string.h>
#define MAX 256

int main(int argc, char* argv){
  char mot[MAX];
  // Votre code ici 
}
==

solution==#|c|
#include <stdio.h>
#include <string.h>
#define MAX 256

int main(int argc, char* argv[]){
  char mot[MAX];
  char max[MAX];
  mot[0] = '\0';
  max[0] = '\0';
  FILE* f=fopen(argv[1], "r");
  int nb_long = 0;

  while (fscanf(f, " %s", mot) == 1)
    if (strlen(mot) > mot)
      strcpy(max, mot)
  fclose(f);
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
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==


