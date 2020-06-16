

author=

title=Construit un palindrome.
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction de prototype `int constpalin(char s[],int taille)` qui reçoit un tableau contenan une chaine de caractères et sa taille et transf
orme si possible la chaine en palindrome en lui ajoutant son  mirroir.<br>
Exemple<br>
Si le tableau s contient "velo" <br>
constpalin(s,10) transforme s en"veloolev" et renvoie 1<br>
et l'appel<br>
constpalin(s,6) laisse s inchangé et renvoie 0
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

==

editor.code==
int constpalin(char s[],int taille){
  int lg=strlen(s);int i;
if(2*lg+1>taille)
    return 0;
for(i=0;i<lg;i++)
  s[lg+i]=s[lg-i-1];
 s[2*lg]='\0';
return 1;
}

==

solution==

int constpalin(char s[],int taille){
  int lg=strlen(s);int i;
if(2*lg+1>taille)
    return 0;
for(i=0;i<lg;i++)
  s[lg+i]=s[lg-i-1];
 s[2*lg]='\0';
return 1;

}
==

codeafter==

int main(void){
  char tab[100];
  int taille;
  scanf("%s",tab);
  scanf("%d",&taille);
  printf("%s\n",tab);			 ;
  constpalin(tab,taille);
  printf("%s\n",tab);
   constpalin(tab,taille);  printf("%s\n",tab);
return 0;
}
==


tests==
[ ["simple éxécution", "","toto 10 "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" "+str(random.randint(15,32))],
  ]
==










