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

title=Tableau de chaînes de caractères
tag=string|malloc|function

editor.height=350px

text==
Le but de cet exercise est d'écrire une fonction **new_tab_string** qui
va lire l'entrée standard pour récupérer un certains nombre de chaînes
de caractères, nombre non connu à la compilation. Toutefois, l'entrée
standard commencera toujours par un entier qui renseignera le nombre de
chaîne de caractère à venir.

Votre fonction devra allouer un tableau de chaîne de caractères (char**)
mais aussi allouer des places mémoires adaptées pour chacune des chaînes
(char*) qui suivront. Après allocation, votre fonction devra copier les 
chaînes vers les places mémoires fraichement allouées.

Voici un exemple d'entrée standard valide que votre fonction sera amennée
à parser.

    6
    première
    seconde
    troisième
    encore
    presque
    fini

==

editor.code==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** new_tab_string(void){
  int n;
  char tmp[65];
  /* ... d'autres variables ...  */
  
  scanf("%d", &n);  /* récupération du nombre de chaînes */
  
  /* ... Encore du code ... */
  scanf("%s", tmp);  /* récupération d'une chaîne */
  /* ... Toujours du code ... */
}
==

solution==#|c|
#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** new_tab_string(void){
  int n;
  char tmp[65];
  char ** ans;
  int i;
  
  scanf("%d", &n);
  ans = malloc( n * sizeof(char*) );

  for(i=0 ; i<n ; i++){
    scanf("%s", tmp);
    ans[i] = strdup(tmp);
  }

  return ans;
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  int i;
  int n = atoi(argv[1]);
  char** ans;

  ans = new_tab_string();
  for (i=0 ; i<n ; i++){
    printf("%s\n", ans[i]);
    free(ans[i]);
  }
  free(ans);

  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", "1", "1\nmot"],
 ["Chaînes vides", "0", "0\n"],
 ["Quatre chaîne", "4", "4\nun\ndeux\ntrois\nquatre"],
 ["Fibonacci", "7", "7\na\nb\ncc\nddd\neeeee\nffffffff\nggggggggggggg"],
 ["Exemple", "6", "6\npremière\nseconde\ntroisième\nencore\npresque\nfini"],
 ["Aléatoire", "10", "\n".join(choices(['red', 'black', 'green'], [2,2,2], k=10))],
 ["Aléatoire", "10", "\n".join(choices(['red', 'black', 'green'], [2,2,2], k=10))]]
==


