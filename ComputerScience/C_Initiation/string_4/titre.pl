title=Mise en titre
tag=tab
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
On définit un mot comme étant une suite de caractères commençant une lettre alphabetique
et une phrase comme une suite de mots séparés par des espaces. Dans un titre tous les mots commencent 
par une majuscule.
Ecrire une fonction `void met_en_titre(char s[])` qui reçoit une phrase sous forme d'une chaie de caractères
et la trasforme en titre.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 50
==

editor.code==

void met_en_titre(char s[]){
  char preced=' ';
  int i=0;
  for (i=0;s[i]!='\0';i++){
    if ('a'<=s[i] && s[i]<='z' &&preced==' ')
      s[i]+='A'-'a';
    preced= s[i];
  }
} 
 
==

solution==

void met_en_titre(char s[]){
  char preced=' ';
  int i=0;
  for (i=0;s[i]!='\0';i++){
    if ('a'<=s[i] && s[i]<='z' &&preced==' ')
      s[i]+='A'-'a';
    preced= s[i];
  }
}
==
codeafter==
int main(void){
  char s[MAX];
  fgets(s,MAX,stdin);
   met_en_titre(s);
   printf("%s\n",s);
   return 0;
}

==


tests==
[ ["simple éxécution", "","ceci est un titre"],
 ["aleatoire",""," ".join(["".join([chr(random.randint(97, 122)) for i in range(random.randint(2,10))]) + " " +"".join([ chr(random.randint(65, 90)) for i in range(random.randint(0,1))]) for j in range(5)])],
  ]
==






