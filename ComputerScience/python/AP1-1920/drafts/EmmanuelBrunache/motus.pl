
author=Emmanuel Brunache


title=Longueur de chaine
tag=string
extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `int motus(char mystere[],char proposition[],int info_sortie[])` qui reçoit une chaine de caractères 'mystere' à découvrir, une chaine de caractères 'proposition' et un tableau d'entiers 'info_sortie' (de même taille que le mot mystère) se remplissant de la manière suivante pour le i-ème caractère de la proposition:
 - 0 si le caractère de la proposition n'est pas dans le mot mystere.
 - 2 si le caractère de la proposition est à la même place dans le mot mystère.
 - 1 si le caractère de la proposition existe dans le mot mystère mais n'est pas à la bonne place.
Elle fait comme la fonction strlen mais vous n'avez bien entendu pas le droit de l'utiliser.
==
code_before==

#include <stdio.h>
#include <stdlib.h>

==

taboo=string.h|strlen

editor.code==
/* ... */  longueurchaine(char tab[]){
/* A compléter */
}

==

solution==
int longueurchaine(char tab[]){
  int i=0;
  while(tab[i]!='\0'){
    i++;
  }
  return i;
}

==

code_after==

int main(int argc, char* argv[]){
    int i;
    i=longueurchaine(argv[1]);

printf("La chaine est de longueur %d\n",i);
return 0;
}
==


checks_args_stdin==#|python|
[ ["simple éxécution", ["bonjour toto"],""],
["alea",["".join([chr(randint(97,122)) for i in range(randint(1,15))])],""]]
==













