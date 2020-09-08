#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Ordonner les appels de fonctions
tag=programme|simple|appel

text==

Un programmeur a préparé trois fonctions pour ce programme. Pas besoin
de les toucher mais vous pouvez bien lire leurs définitions pour
comprendre ce quelles font.
 
Votre objectif est, pour ce second exercice, de fabriquer la fonction
*main* qui permettra d'obtenir un programme fonctionnel après
compilation. Pour cela, vous devrez appeler correctement les trois
fonctions disponibles dans le bon ordre.
   
Remarquez que les trois fonctions ne prennent aucun argument (on peut
lire *void* pour incister sur ce point). Il suffit donc de rajouter
*fonction_pouet();* dans la fonction *main* pour appeler la fonction
nommée *fonction_pouet* dans votre programme. Soyez logique pour
reconstituer l'histoire correctement.

==

editor.code==
#include <stdio.h>

void display_1(void){
  printf("Trois personnes sont donc dans la file d'attente.\n");
}

void display_2(void){
  printf("La file d'attente est vide.\n");
}

void display_3(void){
  printf("Une personne arrive et s'insere dans la file d'attente.\n");
}

int main(int argc, char* argv[]){
  /* votre code ici... */
}

==

solution==
#include <stdio.h>

void display_1(void){
  printf("Trois personnes sont donc dans la file d'attente.\n");
}

void display_2(void){
  printf("La file d'attente est vide.\n");
}

void display_3(void){
  printf("Une personne arrive et s'insere dans la file d'attente.\n");
}

int main(int argc, char* argv[]){
  display_2();
  display_3();
  display_3();
  display_3();
  display_1();

  return 0;
}

==

tests==
[ ["simple éxécution", "", ""] ]
==


