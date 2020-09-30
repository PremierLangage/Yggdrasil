


author=
difficulty=3

title= Simule Join 
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction de prototype `int join(char *insert, char sep)` 
qui reçoit un l'adresse d'une chaine `insert` et un caractère `sep`.

Cette fonction lit l'entrée standard (ce qui est tapé au clavier en général) la recopie sur la sortie standard en remplacant
 les occurences de sep par la chaine insert. 

Exemple :
    "Ceci est l'entrée standard." 
    join("XXX",' ')
    affiche 
    "CeciXXXestXXXl'entréeXXXstandard." 

Lire un caractère:
    int c= getchar(); 
    retourne -1 en fin d'entrée.

Ecrire un caractère:
    putchar(c);

Ecrire une chaine :
    vous devez déjà savoir ... 

==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

==

editor.code==
int join(char s[]){
int i,l;
l=strlen(s);
for(i=0; i<l/2;i++)
    if(s[i]!=s[l-1-i])
        return 0;
return 1;
}
int construit_palin(char s[],int taille){
  int lg=strlen(s);int i;
if(2*lg+1>taille || est_palindrome(s))
    return 0;
for(i=0;i<lg;i++)
  s[lg+i]=s[lg-i-1];
 s[2*lg]='\0';
return 1;
}

==

solution==
int est_palindrome(char s[]){
int i,l;
l=strlen(s);
for(i=0; i<l/2;i++)
    if(s[i]!=s[l-1-i])
        return 0;
return 1;
}
int construit_palin(char s[],int taille){
  int lg=strlen(s);int i;
if(2*lg+1>taille|| est_palindrome(s) )
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
  construit_palin(tab,taille);
  printf("%s\n",tab);
   construit_palin(tab,taille);  printf("%s\n",tab);
return 0;
}
==


tests==
[ ["simple éxécution", "","toto 10 "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" "+str(random.randint(15,32))],
 
 ["aleatoire","",random.choice(["elle","kayak","velo","radar","avion","rotor","serres","solos","suffit"])+" 10"], ]
==














