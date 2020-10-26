#author=Emmanuel Brunache
author=

title=Longueur de chaine

tag=string|FinDeChaine

extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `longueurchaine` qui reçoit une chaine de caractères et renvoie le nombre de caractères de cette chaîne.<br>
Elle fait comme la fonction <u>strlen</u> mais vous n'avez bien entendu pas le droit de l'utiliser.
==
code_before==

#include <stdio.h>
#include <stdlib.h>

==

taboo=string|strlen

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














