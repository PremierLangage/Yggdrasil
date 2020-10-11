author=Emmanuel Brunache


title=strlen
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `longueurchaine` qui reçoit une chaine de caractères renvoie le nombre de caractères de cette chaine. Elle fait comme la fonction strlen mais vous n'avez bien entendu pas le droit de l'utiliser.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>

==

taboo=string.h

editor.code==
/* ... */  longueurchaine(char tab[]){
/* A compléter */
}

==

solution==
void longueurchaine(char tab[]){
  int i=0;
  while(tab[i]!='\0'){
    i++
  }
  return i
}

==

codeafter==

int main(void){
  char tab[100];
  int i;
scanf("%s",tab);
i=longueurchaine(tab);

printf("La chaine est de longueur %d\n",i);
return 0;
}
==


tests==
[ ["simple éxécution", "","toto o i "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" c C"],
  ]
==











