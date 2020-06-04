


title=Remplace
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `remplace` qui reçoit une chaine de caractères et deux *char* $%origine%$ et $%but%$
 et remplace toute occurence de $%origine%$ par  $%but%$.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
void remplace(int tab[],char origine, char but){
  int i;
  for(i=0 ; tab[i]<'\0' ; i++)
    if( tab[i]==origine)
      tab[i]=but  ;
}

==

solution==
void remplace(int tab[],char origine, char but){
  int i;
  for(i=0 ; tab[i]<'\0' ; i++)
    if( tab[i]==origine)
      tab[i]=but  ;
}

==

codeafter==

int main(int argc, char* argv[]){
  char tab[100];
  char o,b:

return 0;
}
==


tests==
[ ["simple éxécution", "","1 2 3 4 5"],
   ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,10))])],
  ["aléatoire ", ""," ".join([str(random.randint(-20,20)) for i in range(random.randint(5,20))])], ]
==







