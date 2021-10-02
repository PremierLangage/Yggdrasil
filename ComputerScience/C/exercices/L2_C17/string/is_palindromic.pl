#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Prog C L2 Team

title=Reconnaitre un palindrome

tag=tableau|string|palindrome

extends=/ComputerScience/C/template/stdsandboxC.pl

text==#|markdown|
Un **palindrome** est une suite de caractères pouvant indifféremment être lue de 
gauche à droite ou bien de droite à gauche. Ainsi `elle`, `été` et `laval` sont des 
palindromes. Ecrire une fonction `est_palindrome` qui reçoit une chaine de caractères 
et renvoie `1` si celle-ci est un palindrome, et `0` sinon.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 50
==

editor.code==#|c|
int est_palindrome(char s[]){
  // Votre code ici...
  return ...;
}
==

solution==#|c|
int est_palindrome(char s[]){
int i,l;
l=strlen(s);
for(i=0; i<l/2;i++)
    if(s[i]!=s[l-1-i])
        return 0;
return 1;
}
==

code_after==#|c|
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

checks_args_stdin==#|python|
[ 
  ["Un petit palindrome", [], choice(["elle", "kayak", "radar", "rotor", "serres", "solos", "laval"])],
  ["Pas un palindrome", [], choice(["elle est belle", "un kayak", "velo", "deux radar", "avion", "le rotor", "michel serres", "Bruno solos", "suffit"])],
]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==
