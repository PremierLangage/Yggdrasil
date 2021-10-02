

author= 

title=Palindrome

tag=tableau|string

extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Un palindrome est une suite de caractères pouvant indifféremment être lue de gauche à droite ou de droite à gauche.  
Ainsi $% \tt{elle,été,laval}%$ sont des palindromes.  
Ecrire une fonction `est_palindrome` qui reçoit une chaine de caractères 
et renvoie 1 si celle-ci est un palindrome, et 0 sinon.
==

codebefore==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 50

==

editor.code==
int est_palindrome(char s[]){
/* A compléter */
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
==

codeafter==
int main(void){
  char s[MAX];
  scanf("%s",s);
  if (est_palindrome(s))
    printf("\"%s\" est un palindrome\n",s);
  else 
    printf("\"%s\" n'est pas un palindrome\n",s);
  return 0;
}

==


tests==
[ 
 ["aleatoire","",random.choice(["elle","kayak","radar","rotor","serres","solos",])],
["aleatoire","",random.choice(["elle est belle","un kayak","velo","deux radar","avion","le rotor","michel serres","Bruno solos","suffit"])],
   ]
==














