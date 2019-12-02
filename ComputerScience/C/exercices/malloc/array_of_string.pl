# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Tableau de chaînes de caractères

author=Nicolas Borie
title=Tableau de chaînes de caractères
tag=string|malloc|function
extends=/ComputerScience/C/template/stdsandboxC.pl

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

editor.code==
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

solution==

#define _SVID_SOURCE

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


codeafter==

#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
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

tests==

def rand_stdin(n):
    L = ["Salut", "bonjour", "Pouet", "bla", "anti-constitutionnellement", "FOO", "Baracouda", "Plop", "malloc_c_est_nul"]
    return ["Test aléatoire", str(n), str(n)+"\n".join([random.choice(L) for i in range(n)]) ]

[["Exécution simple", "1", "1\nmot"],
 ["Chaînes vides", "0", "0"],
 ["Quatre chaîne", "4", "un\ndeux\trois\nquatre"],
 ["fibonacci", "7", "7\na\nb\ncc\nddd\neeeee\nffffffff\nggggggggggggg"],
 rand_stdin(5),
 rand_stdin(random.randint(5, 10)),
 rand_stdin(10, 20)]

==

