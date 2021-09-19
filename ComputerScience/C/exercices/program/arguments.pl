#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Afficher les arguments d'un programme C
tag=programme|argument|terminal|affichage

text==

Écrire un programme C qui affiche les arguments que l'on lui a passés 
lors de son appel en ligne de commandes. Le programme ne devra
pas afficher son nom qui est toujours positionné en tête du tableau
des arguments. On affichera un argument par ligne. Exécuté sans
argument, le programme ne doit donc rien afficher.

<br />

Voici un exemple d'exécution si le programme se nome a.out

<br />

    Platon@debian~$> ./a.out voici 3 arguments
    voici
    3
    arguments

Veuillez à bien placer un seul argument par ligne, sans espace avant ou après, 
juste un retour à la ligne.
==

editor.code==
#include ...

int main(...){
  ...
}

==

code_before==
==

code_after==
==

solution==
#include <stdio.h>

int main(int argc, char* argv[]){
  int i;

  for (i=1 ; i<argc ; i++)
    printf("%s\n", argv[i]);
    
  return 0;
}

==

checks_args_stdin==
[["Test basique", ["argument1"], ""],
["Sans argument", [], ""],
["Argument multiple", ["arg1", "arg2", "arg3", "arg4"], ""],
["Mélange", ["argument1", "192", "poule", "foo", "42"], ""],
["Complexe", ["'argument en plusieurs mots' mot_unique"], ""],
["Test aléatoire", [choice(["Harder", "Better", "Faster", "Stronger"]) for i in range(randint(1, 10))], ""],
["Test aléatoire", [choice(["Harder", "Better", "Faster", "Stronger"]) for i in range(randint(1, 10))], ""],
["Test aléatoire", [choice(["Harder", "Better", "Faster", "Stronger"]) for i in range(randint(1, 10))], ""]]
==


astuces==#|python|
[
  { "content": """En langage C, un programme à paramètres est une fonction `main` ayant deux arguments : `argc` qui donne le nombre d'arguments et `argv` qui est le tableau des arguments transmis au programme."""},
  { "content": """`argv[0]` est le nom du programme compilé et en cours d'exécution. Ce n'est pas un argument standard."""},
  { "content": """Une boucle `for` allant de `1` inclus à `argc` exclus est une bonne stratégie."""},
  { "content": """De nombreuses fonctions permettent d'écrire juste un mot avant de retourner directement à la ligne. `printf` et `puts` font facilemnet ce travail."""}
]
==
