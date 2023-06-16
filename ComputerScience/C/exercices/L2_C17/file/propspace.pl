
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

tag=fichier|programme|affichage|lecture

author=DR

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
Écrire un programme C qui prend un argument qui sera toujours le nom d'un 
fichier positionné dans le répertoire courrant et sur dont vous aurez les 
droits de lecture. Votre programme devra ouvrir ce fichier, le 
lire son contenu et afficher la proportion d'espaces qu'il contient. 

Attention on veut afficher un pourcentage. 

Un fichier contenant 3 ' ' (espaces) et 3 autres caractères affichera :

    Proportion d'espaces : 50.00% 

Pour faire un affichage formaté propre, utiliser `printf` avec le format suivant :
`"%c: %5.2f%%\n"` (le floatant est sur 5 colonnes avec 2 chiffres après la virgule.)

==

code_before==#|c|
==

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  // Votre code ici 


    printf("Proportion d'espaces : %5.2%\n", ...); 

}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  FILE* f=fopen(argv[1], "r");
  int c;
  float nbs=0, nbt=0;
  while ((c = fgetc(f)) != EOF)
    { if (c == ' ')  nbs++;
    nbt++;
    }
  fclose(f);
  printf("Proportion d'espaces : %5.2f%%\n\n", (nbs/nbt)*100); 
  return 0;
}
==

code_after==#|c|

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
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==

