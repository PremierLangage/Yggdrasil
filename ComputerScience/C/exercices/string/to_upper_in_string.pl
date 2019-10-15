# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Mettre les lettres en majuscule dans une chaîne

author=Nicolas Borie
title=Mettre les lettres en majuscule dans une chaîne
tag=string|function
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction C qui prend en argument une chaîne de caractères
et qui modifie les lettres minuscules qui y sont dedans pour les
transformer en leur majuscules correspondantes.

Les autres caratères contenus dans la chaînes qui ne sont pas des
lettres minuscules ne seront pas affectés par la fonction.
    
==

editor.code==
void to_upper_in_string(...){
  ...
}

==

solution==

void to_upper_in_string(char* s){
  int i;
  for(i=0 ; s[i]!='\0' ; i++){
    if ((s[i] >= 'a') && (s[i] <='z'))
      s[i] = s[i]-'a'+'A';
  }  
}

==

codeafter==

#include <stdio.h>

int main(int argc, char* argv[]){
  to_upper_in_string(argv[1]);
  printf("%s\n", argv[1]);
  return 0;
}

==

    
tests==
[ ["Basique", "pouet", ""],
  ["Chaîne mélangé", '"PoUeT"', ""],
  ["Chaîne vide", '""', ""],
  ["Trois mots", '"Pouet pouet TAGAda"', ""],
  ["Long mot", "Anti-ConstitutionnelleMent", ""],
	["Grand mélange ascii", '"dK$#%djsDFG*&dwr#$-cwFWwdW $#e"', ""],
  ["Aléatoire", "".join([chr(random.randint(97,122)-(32*random.randint(0,1))) for i in range(20)]), ""] ]
==

