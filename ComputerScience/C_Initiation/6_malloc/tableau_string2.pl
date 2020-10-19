
# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Proposition de correction Clément BOIN <clement.boin@u-pem.fr>
# Tableau de chaînes de caractères
author=Nicolas Borie
title=Tableau de chaînes de caractères
tag=string|malloc|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Le but de cet exercice est d'écrire une fonction **new_tab_string** qui
va lire l'entrée standard pour récupérer un certains nombre de chaînes
de caractères. Ce nombre passé en paramètre de la fonction. 

Votre fonction devra allouer un tableau de chaîne de caractères (char**)
mais aussi allouer des places mémoires adaptées pour chacune des chaînes
(char*) qui suivront. Après allocation, votre fonction devra copier les 
chaînes vers les places mémoires fraichement allouées.

Voici un exemple d'entrée standard valide que votre fonction sera amennée
à parser.

    première
    seconde
    troisième
    encore
    presque
    fini

==

editor.code==
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** new_tab_string(int n){
  char tmp[65];
  /* ... d'autres variables ...  */
  
  
  /* ... Encore du code ... */
  scanf("%s", tmp);  /* récupération d'une chaîne */
  /* ... Toujours du code ... */
}

==

solution==

#define _SVID_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** new_tab_string(int n){
  char tmp[65];
  char ** ans;
  int i;
  
  ans = malloc( n * sizeof(char*) );

  for(i=0 ; i<n ; i++){
    scanf("%s", tmp);
    ans[i] = strdup(tmp);
  }

  return ans;
}

==


codeafter==

#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  int i;
  int n = atoi(argv[1]);
  char** ans;

  ans = new_tab_string(n);
  for (i=0 ; i<n ; i++){
    printf("%s\n", ans[i]);
    free(ans[i]);
  }
  free(ans);

  return 0;
}

==

tests==

[["Exécution simple", "1", "\nmot"],
 ["Chaînes vides", "0", "\n"],
 ["Quatre chaîne", "4", "\nun\ndeux\ntrois\nquatre"],
 ["Fibonacci", "7", "\na\nb\ncc\nddd\neeeee\nffffffff\nggggggggggggg"],
 ["Exemple", "6", "\npremière\nseconde\ntroisième\nencore\npresque\nfini"],
 ["Aléatoire", "10", "\n".join(random.choices(['red', 'black', 'green'], [2,2,2], k=10))],
 ["Aléatoire", "10", "\n".join(random.choices(['red', 'black', 'green'], [2,2,2], k=10))]]

==






