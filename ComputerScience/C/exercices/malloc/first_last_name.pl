# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Recopier deux chaînes de caractère

author=Nicolas Borie
title=Deux chaînes à allouer et recopier dans une structure
tag=string|malloc|structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction qui prend en argument l'adresse d'une structure **People**
ainsi que deux chaînes de caractères. La structure 

==

editor.code==
#include <stdlib.h>
#include <string.h>

typedef struct{
  char* first;
  char* last;
}People;

int initialize_People(People* p, char* fisrt_name, char* last_name){
    /* ... tant de choses ... */
}

==

solution==

#define _SVID_SOURCE

#include <stdlib.h>
#include <string.h>

typedef struct{
  char* first;
  char* last;
}People;

int initialize_People(People* p, char* fisrt_name, char* last_name){
    p->first = strdup(fisrt_name);
    p->last = strdup(last_name);

    return (p->first != NULL) && (p->last != NULL);
}


==


codeafter==

#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  People p;

  initialize_People(&p, argv[1], argv[2]);
  printf("Init %s %s\n", p.first, p.last);

  free(p.first);
  free(p.last);
  return 0;
}

==

tests==

[["Exécution simple", "Pierre Paul Jacques", ""],
 ["Chaînes vides", "'' ''", ""],
 ["Long prénom", "'Son prénom est si long que ça, incroyable !' Ouais", ""],
 ["Aléatoire", " ".join(["".join([chr(ord('a')+random.randint(0, 25)) for i in range(random.randint(3, 20))]) for k in range(2)]), ""]]

==

