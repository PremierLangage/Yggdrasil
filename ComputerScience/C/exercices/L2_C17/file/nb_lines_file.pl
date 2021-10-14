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

title=Compter le nombre de lignes d'un fichier

tag=fichier|programme|lignes

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
droits de lecture. Votre programme devra afficher le nombre de lignes du 
fichier en argument comme il suit :

    Nombre de lignes du fichier : xxxx

Il faudra retourner à la ligne juste après le nombre entier sans espace superflu.
Même si le fichier contient 0 ou 1 ligne, on ne supprimera pas le `s` final du mot 
`lignes` par soucis de simplicité.


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


