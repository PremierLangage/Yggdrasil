

author=  

title=Remplace

tag=string|char

extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `remplace` qui reçoit une chaine de caractères et deux *char* $%origine%$ et $%but%$
 et remplace toute occurrence de $%origine%$ par  $%but%$.<br>
Par exemple si : <br>
tab = 'gourde et origine = 'g' et but = 'b' alors tab='`b`ourde'<br>
Aucune utilisation de la bibliothèque `string.h` n'est permise
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

taboo=string

editor.code==
void remplace(char tab[],char origine, char but){
/* A compléter */
}

==

solution==
void remplace(char tab[],char origine, char but){
  int i;
  for(i=0 ; tab[i]!='\0' ; i++)
    if( tab[i]==origine)
      tab[i]=but;
}
==

codeafter==
int main(void){
  char tab[100];
  char o,b;
scanf("%s",tab);
scanf( " %c %c",&o,&b);
remplace(tab,o,b);

printf("%s\n",tab);
return 0;
}
==


tests==
[ ["simple éxécution", "","toto o i "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" c C"],
  ]
==














