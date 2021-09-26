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

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Nicolas Borie

editor.height=350px

title=Encadrer une chaine de caractères C
tag=string|fonction|chaine|taille


text==#|markdown|
Écrire une fonction C qui prend en argument une **chaîne de caractères**
et qui affiche cette chaîne de manière encadrée avec des caractères \#.


Ainsi, si le mot est "pouet", la fonction devra alors afficher:

    #########
    # pouet #
    #########

Le cadre est espacé du mot d'un espace avant et après la chaîne.
On affichera rien du tout si la chaîne en argument est la chaîne vide.
==

editor.code==#|c|
#include <stdio.h>
#include <string.h>

... frame_string(...){
  // Votre code ici...
}

==

solution==#|c|
#include <stdio.h>
#include <string.h>    

void frame_string(char* text){
  int len=strlen(text)+4;
  int i;

  if (len == 4)
      return ;
  
  for (i=0 ; i<len ; i++)
      printf("#");
  printf("\n");
  printf("# %s #\n", text);
  for (i=0 ; i<len ; i++)
      printf("#");
  printf("\n");
}
==

code_before==#|c|

==

code_after==#|c|
int main(int argc, char* argv[]){
  frame_string(argv[1]);
  return 0;
}

==

checks_args_stdin==#|python|    
[ ["Test basique", ["pouet"], ""],
  ["Chaîne composée", ["deux mots"], ""],
  ["Chaîne vide", [""], ""],
  ["Un long mot", ["Anti-constitutionnellement"], ""],
  ["Plein de mots", ["Cela fait sept mots dans un mot"], ""],
  ["Test aléatoire 1", [choice(["voiture", "avion", "train", "bateau", "char", "skate", "overcraft"])], ""],
  ["Test aléatoire 2", [choice(["voiture", "avion", "train", "bateau", "char", "skate", "overcraft"])], ""] ]
==

astuces==#|python|
[
  { "content": """Il faut connaitre la taille de la chaîne pour procéder à son encadrement."""},
  { "content": """La chaîne vide doit être traitée séparément et donc une conditionnelle doit lui être dédiée dans les sources."""},
  { "content": """Dans le cas général, pour une chaîne de longueur `l`, il faut `l+4` caractères dièses pour faire la première ligne."""}
]
==


