
#author=Zip

author=

difficulty=3

title=Construit un palindrome.

tag=string

extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction de prototype `int construit_palin(char s[],int taille)` 
qui reçoit un tableau de taille `taille` contenant une chaine de caractères et la transforme,
si possible, en palindrome: 
<ul>
<li> si la chaine est déjà un palindrome elle reste inchangée </li>
<li> sinon, 
  <ul>
    <li> si la taille du tableau est suffisante, on la concatène à son miroir pour que le tableau contienne un palindrome.</li>
    <li> Si la taille du tableau n'est pas suffisante, on ne fait rien. </li> 
  </ul>
</li>
</ul>
<u>Exemple :</u><br><br>
Si le tableau `s` contient "velo", `construit_palin(s,20)` transforme `s` en "veloolev" et renvoie 1
et l'appel suivant `construit_palin(s,20)` laisse `s` inchangé et renvoie 0.<br>

Si le tableau s contient "velo", l'appel `construit_palin(s,6)` laisse `s` inchangé et renvoie 0.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

==

editor.code==

int construit_palin(char s[],int taille){
 /* A compléter */
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
  int lg=strlen(s);
  int i;
  if(2*lg+1>taille||est_palindrome(s))
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





















