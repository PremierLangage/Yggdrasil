
#author= Zip&DR
author=

title=Mise en titre

tag=tableau|string|char|OperationCaractere

extends=/ComputerScience/C/template/stdsandboxC.pl

text==
On définit un mot comme étant une suite de caractères commençant par une lettre alphabetique
et une phrase comme une suite de mots séparés par des espaces.<br>
Dans un titre, tous les mots commencent par une majuscule.<br><br>
Ecrire une fonction `void met_en_titre(char s[])` qui reçoit une phrase sous forme d'une chaîne de caractères
et la <u> transforme en titre </u>.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 50
==

editor.code==

void met_en_titre(char s[]){
/* A compléter */
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














