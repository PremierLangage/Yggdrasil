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

author=Nicolas Borie

title=Concaténation de deux chaines

tag=string|chaine|conversion|verification

text==#|markdown|
Écrire une fonction **str_merge** qui prend en argument trois adresses de chaînes de caractères.
Votre fonction devra concaténer les deux premières chaînes (d'abord la permière puis 
la seconde à sa droite) dans la dernière chaîne en argument. Cette dernière est supposée
disposée largement suffisement de mémoire pour contenir les deux autres.
==

editor.code==#|c|
void str_merge(char s1[], char s2[], char result[]){
  // votre code ici...
}
==

solution==#|c|
void str_merge(char s1[], char s2[], char result[]){
  int i, j;
  for (i=0 ; s1[i]!='\0' ; i++)
    result[i] = s1[i];
  for (j=0 ; s2[j]!='\0' ; j++)
    result[i+j] = s2[j];
  result[i+j] = '\0';
}
==

code_before==#|c|

==

code_after==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[]){
  srand(time(NULL));
  char s[80];
  int i;
  for (i=0 ; i<80 ; i++)
    s[i] = (rand() % 90) + 30;
  s[79] = '\0';
  str_merge(argv[1], argv[2], s);
  puts(s);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["Recto ", "Verso"], ""],
  ["Second mot vide", ["RienAGauche", ""], ""],
  ["Premier mot vide", ["", "Rien avant"], ""],
  ["Deux mots vides", ["", ""], ""],
  ["Test Aléatoire 1", [choice(["Vélo ", "Avion ", "Bateau ", "Scooter ", "Skate "]), choice(["vert", "bleu", "rouge", "noir", "rose", "blanc", "multicolore"])], ""],
  ["Test Aléatoire 2", [choice(["Vélo ", "Avion ", "Bateau ", "Scooter ", "Skate "]), choice(["vert", "bleu", "rouge", "noir", "rose", "blanc", "multicolore"])], ""],
  ["Test Aléatoire 3", [choice(["Vélo ", "Avion ", "Bateau ", "Scooter ", "Skate "]), choice(["vert", "bleu", "rouge", "noir", "rose", "blanc", "multicolore"])], ""] ]
==

astuces==#|python|
[
  { "content": """Le mieux est de recopier char par char depuis les deux premières chaînes vers la dernière."""},
  { "content": """Pour cette fonction, vous aurez besoin de deux boucles `for`, l'une à la suite de l'autre, chacune parcourrant une des deux premières chaînes."""},
  { "content": """Le caractère `'\\0'` arrête les parcours dans deux boucles. Une fois tous les caractères placés dans la dernière chaîne, il ne faut pas oublier d'indiquer qu'elle se termine en y plaçant aussi le caractère de fin de chaîne à la fin."""}
]
==


