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
@f6.txt
@titi
@toto

text==#|markdown|
Écrire un programme C dont les arguments seront des noms de fichiers potentiellement
situés dans le répertoire courant de travail. le but de cet exercice est de tenter 
d'ouvrir ces fichiers en mode lecture et de faire un affichage, fichier par fichier, 
pour rendre compte de la possibilité de les ouvrir ou pas.

    $> ./a.out ficher1 fichier2 fichier3 fichier4
    Le fichier ficher1 a bien été ouvert.
    Le fichier ficher2 a bien été ouvert.
    L'ouverture du fichier ficher3 a échouée.
    Le fichier ficher4 a bien été ouvert.

N'oubliez pas de fermer les fichiers après les avoir ouvert.


==

code_before==#|c|
==

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  // Votre code ici 
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  FILE* f;
  int i;

  for (i=1 ; i<argc ; i++){
    f = fopen(argv[i], "r");
    if (f == NULL){
      printf("L'ouverture du fichier %s a échouée.\n", argv[i]);
    }
    else{
      fclose(f);
      printf("Le fichier %s a bien été ouvert.\n", argv[i]);
    }
  }
  return 0;
}
==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Sans argument", [], ""],
  ["Un fichier ouvrable", ["toto"], ""],
  ["Un fichier qui n'existe pas", ["tata"], ""],
  ["Test aléatoire 1", sample(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt", "titi", "toto", "tata", "f6.txt", "f7.txt", "perdu"], randint(1, 7)), ""] ]
==

astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF. Il y a autant de ligne que de retour à la ligne."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc` et `fclose`. Trois variables locales peuvent suffire : un entier pour stocker le caractère, un entier pour accumuler le nombre d'occuence de '\n' et une variable de type `FILE*`."""}
]
==



