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

author=Nicolas Borie
title=Reconvertir en décimal des chiffres romains

tag=function|chaîne|difficile|romain|décimanl|conversion

editor.height=350px

text==#|markdown|
Écrire une fonction **roman2dec** qui prend en argument une chaîne de
caractères qui décrira toujours un nombre écrit en numérotation
romaine compris entre 1 et 3999. La fonction devra retourner l'entier
C qui correspond à ce nombre romain en argument.

<br>

Pour rappel, voici les symboles romains et leurs valeurs associées en
base décimale.

$% 
\\begin{array}{|c|c|c|c|c|c|c|} \\hline
I & V & X  &  L &   C &   D &    M \\\\ \\hline
1 & 5 & 10 & 50 & 100 & 500 & 1000 \\\\ \\hline
\\end{array} 
%$

<br>

Par exemple, pour la chaîne de caractères `"MMMCDLXXXIX"`, le chiffre
à calculer en base 10 sera `3489`. Ainsi un appel à la fonction **roman2dec**
avec l'argument `"MMMCDLXXXIX"` devra retourner `3489`. 

<br>

MMMCDLXXXIX --> 1000+1000+1000+(-100)+500+50+10+10+10+(-1)+10 = 3489

<br>

*Globalement, le fin tacticien aura repéré qu'il faut aditionner les
valeurs des symboles dans le nombre romain sauf quand un symbole est
suivi d'un plus grand (IV, IX, XL, XC, etc...), à ce moment là, la
valeur du symbole doit être soustraite. (source: Chiffres Romains -
Numération - Mathématiques : CM1 - Cycle 3)*
==

editor.code==#|c|
int roman2dec(char* s){
  // Votre code ici...
}
==

solution==#|c|
int convert_letter(char c){
  switch(c){
  case 'I': return 1;
  case 'V': return 5;
  case 'X': return 10;
  case 'L': return 50;
  case 'C': return 100;
  case 'D': return 500;
  case 'M': return 1000;
  default: return -1;
  }
}

int roman2dec(char* s){
  int ans=0;
  int i;
  int value;

  for(i=0 ; s[i]!='\0' ; i++){
    value = convert_letter(s[i]);
    if ((s[i+1] == '\0') || (value >= convert_letter(s[i+1]))){
      ans += value;
    }
    else{
      ans -= value;
    }
  }
  return ans;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
void dec2roman(int d, char* s){
  if (d >= 1000){
    s[0] = 'M';
    dec2roman(d-1000, s+1);
    return ;
  }
  if (d >= 900){
    s[0] = 'C';
    s[1] = 'M';
    dec2roman(d-900, s+2);
    return ;
  }
  if (d >= 500){
    s[0] = 'D';
    dec2roman(d-500, s+1);
    return ;
  }
  if (d >= 400){
    s[0] = 'C';
    s[1] = 'D';
    dec2roman(d-400, s+2);
    return ;
  }
  if (d >= 100){
    s[0] = 'C';
    dec2roman(d-100, s+1);
    return ;
  }
  if (d >= 90){
    s[0] = 'X';
    s[1] = 'C';
    dec2roman(d-90, s+2);
    return ;
  }
  if (d >= 50){
    s[0] = 'L';
    dec2roman(d-50, s+1);
    return ;
  }
  if (d >= 40){
    s[0] = 'X';
    s[1] = 'L';
    dec2roman(d-40, s+2);
    return ;
  }
  if (d >= 10){
    s[0] = 'X';
    dec2roman(d-10, s+1);
    return ;
  }
  if (d >= 9){
    s[0] = 'I';
    s[1] = 'X';
    dec2roman(d-9, s+2);
    return ;
  }
  if (d >= 5){
    s[0] = 'V';
    dec2roman(d-5, s+1);
    return ;
  }
  if (d >= 4){
    s[0] = 'I';
    s[1] = 'V';
    dec2roman(d-4, s+2);
    return ;
  }
  if (d >= 1){
    s[0] = 'I';
    dec2roman(d-1, s+1);
    return ;
  }
  s[0] = '\0';
}

int main(int argc, char* argv[]){
  char s[50];
  int i;

  for(i=1 ; i<argc ; i++){
    dec2roman(atoi(argv[i]), s);
    printf("%s --> %d\n", s, roman2dec(s));
  }
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Tous les chiffres base 10", ["1", "2", "3", "4", "5", "6", "7", "8", "9"], ""],
 ["Tous les symboles romains", ["1", "5", "10", "50", "100", "500", "1000"], ""],
 ["Test aléatoire 1", [str(randint(1, 3999)) for i in range(5)], ""],
 ["Test aléatoire 2", [str(randint(1, 3999)) for i in range(5)], ""],
 ["Test aléatoire 3", [str(randint(1, 3999)) for i in range(5)], ""],
 ["Test aléatoire 4", [str(randint(1, 3999)) for i in range(5)], ""],
 ["Test aléatoire 5", [str(randint(1, 3999)) for i in range(5)], ""], ]
==

astuces==#|python|
[
  { "content": """Une bonne idée consiste à coder plusieurs fonctions. Notament, écrire une fonction qui à chaque lettre peut retourner sa valeur correspondante. Avoir cette tâche isolée et indépendante va grandement simplifier le problème."""},
  { "content": """"""},
  { "content": """"""}
]
==


