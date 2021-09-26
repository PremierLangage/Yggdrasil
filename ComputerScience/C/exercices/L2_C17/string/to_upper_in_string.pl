#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Mettre les lettres en majuscule dans une chaîne
tag=string|chaine|fonction|lettre|caractère|ascii

text==#|markdown|
Écrire une fonction C qui prend en argument une chaîne de caractères
et qui modifie les lettres minuscules qui y sont dedans pour les
transformer en leur majuscules correspondantes.

Les autres caratères contenus dans la chaînes qui ne sont pas des
lettres minuscules ne seront pas affectés par la fonction.
==

editor.code==#|c|
void to_upper_in_string(...){
  ...
}
==

solution==#|c|
void to_upper_in_string(char* s){
  int i;
  for(i=0 ; s[i]!='\0' ; i++){
    if ((s[i] >= 'a') && (s[i] <='z'))
      s[i] = s[i]-'a'+'A';
  }  
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  to_upper_in_string(argv[1]);
  printf("%s\n", argv[1]);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test basique", ["pouet"], ""],
  ["Chaîne mélangé", ["PoUeT"], ""],
  ["Chaîne vide", [""], ""],
  ["Trois mots", ["Pouet pouet TAGAda"], ""],
  ["Long mot", ["Anti-ConstitutionnelleMent"], ""],
	["Grand mélange ascii", ["dK$#%djsDFG*&dwr#$-cwFWwdW $#e"], ""],
  ["Test aléatoire 1", ["'"+"".join([chr(randint(65,122)) for i in range(20)])+"'"], ""],
  ["Test aléatoire 2", ["'"+"".join([chr(randint(65,122)) for i in range(20)])+"'"], ""],
  ["Test aléatoire 3", ["'"+"".join([chr(randint(65,122)) for i in range(20)])+"'"], ""] ]
==

astuces==#|python|
[
  { "content": """Une bonne boucle `for` suffit pour écrire une telle fonction."""},
  { "content": """Pour detecter si un caractère `char c` est une lettre minuscule, on vérifie que ce dernier est coincé entre `a` et `z` : `(c >= 'a') && (c <= 'z')`."""},
  { "content": """Pour transformer un caractère `char c` de type lettre minuscule vers sa majuscule correspondante, il faut procéder à une translation dans le code ASCII de vecteur `'A' - 'a'` : ainsi `c + 'A' - 'a'` est la majuscule associée à la minuscule `c`."""}
]
==
