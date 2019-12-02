# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Recopier deux chaînes de caractère

author=Nicolas Borie
title=Deux chaînes à allouer et recopier dans une structure
tag=string|malloc|structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Écrire une fonction **initialize_people** qui prend en argument l'adresse 
d'une structure **People** ainsi que deux chaînes de caractères. Votre
fonction devra allouer dynamiquement la place mémoire nécessaire pour 
contenir une copie des deux chaines en argument. Votre fonction devra
finalement recopier intégralement les deux chaînes dans les deux champs
fraichement alloués. 

<br />

Inutile d'allouer la structure **People**, le pointeur fourni en argument
pointe déjà vers une structure **People** valide, vous sevez travaillez sur
les champs de la structure pointée.

==

editor.code==
#include <stdlib.h>
#include <string.h>

typedef struct{
  char* first;
  char* last;
}People;

int initialize_people(People* p, char* first_name, char* last_name){
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

int initialize_people(People* p, char* first_name, char* last_name){
    p->first = strdup(first_name);
    p->last = strdup(last_name);

    return (p->first != NULL) && (p->last != NULL);
}


==


codeafter==

#include <stdio.h>
#include <time.h>

int main(int argc, char* argv[]){
  People p;

  initialize_people(&p, argv[1], argv[2]);
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
 ["Aléatoire", " ".join(["".join([chr(ord('a')+random.randint(0, 25)) for i in range(random.randint(3, 20))]) for k in range(2)]), ""],
 ["Aléatoire", " ".join(["".join([chr(ord('a')+random.randint(0, 25)) for i in range(random.randint(3, 20))]) for k in range(2)]), ""]]

==

