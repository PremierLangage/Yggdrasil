#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Qualifier l'entrée standard
tag=clavier|entrées|sorties|difficile|entier|flottant

text==
Écrire un programme qui qualifie ce qu'il reçoit sur l'entrée standard. L'entrée 
standard ne comportera aucun délimiteur (pas d'espace, pas de tabulation, 
seulement un retour chariot à la fin de cette dernière). Globalement, l'entrée 
standard ne sera ainsi composée que d'un gros tas de cractères (au plus 100 
caractères) avec un retour à la ligne final.

<br />

Vous devrez alors reconnaitre si l'entrée standard décrit :

  * Un nombre entier positif   
  * Un nombre flottant positif   
  * Un mot   
  * Une entrée invalide (rien des trois au dessus)   

<br />

Un nombre entier commence par un chiffre différent de zéro puis est suivi de chiffres.
Un nombre flottant a la même structure qu'un nombre entier mais doit incorporer un point 
n'importe où dans son contenu. Un nombre flottant peut quand même commencer par un zéro seulement 
s'il est directement suivi du point. Un mot est une séquence de lettres minuscules mais peut 
commencer possiblement par une lettre majuscule. À l'exception de ces trois descriptions 
toute autre entrée sera invlide. L'entrée vide sera le mot vide.

<br />

Une fois le contenu de l'entrée standard reconnu, votre programme n'aura qu'à 
afficher une phrase associée à ce qu'il a reconnu.

==

editor.height=350px

editor.code==#|c|
#include <stdio.h>
#include <string.h>

int is_int(char* s){
  int i;

  if ((s[0] < '1') || (s[0] > '9'))
    return 0;
  for (i=1 ; s[i]!='\0' ; i++)
    if ((s[i] < '0') || (s[i] > '9'))
      return 0;
  return 1;
}

int is_word(char* s){
  int i;

  if (s[0] == '\0')
    return 1;
  if (((s[0] < 'a') || (s[0] > 'z')) && ((s[0] < 'A') || (s[0] > 'Z')))
    return 0;
  for (i=1 ; s[i]!='\0' ; i++)
    if ((s[i] < 'a') || (s[i] > 'z'))
      return 0;
  return 1;
}

int is_float(char* s){
  int i=0;
  int point=0;

  if ((s[0] == '0') && (s[1] == '.')){
    i = 2;
    point = 1;
  }
  else{
    if (((s[0] < '1') || (s[0] > '9')) && (s[0] != '.'))
      return 0;
    else{
      if (s[0] == '.')
        point=1;
      i = 1;
    }
  }
  for ( ; s[i]!='\0' ; i++){
    if ((s[i] == '.') && (point == 0)){
      point = 1;
      continue;
    }
    if ((s[0] < '0') || (s[0] > '9'))
      return 0;
  }
  return 1;
}

int main(int argc, char* argv[]){
  char s[100];

  scanf("%s", s);

  if is_word(s){
    printf("J'ai lu un mot.\n");
    return 0;
  }
  if is_int(s){
    printf("J'ai lu un nombre entier.\n");
    return 0;
  }
  if is_float(s){
    printf("J'ai lu un nombre flottant.\n");
    return 0;
  }
  printf("J'ai lu une entrée invalide.\n");
  return 0;
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){

}
==

code_before==#|c|
==

code_after==#|c|
==

checks_args_stdin==#|python|
[["Test basique 1", [], "Pelle\n"],
 ["Test basique 2", [], "421\n"],
 ["Test basique 3", [], "3.141592\n"],
 ["Test basique 4", [], "13baobab.234\n"]]
==


