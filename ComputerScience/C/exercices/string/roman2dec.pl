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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie
title=Reconvertir en décimal des chiffres romains

tag=function|chaîne|difficile|romain|décimanl|conversion

text==

==

editor.code==#|c|

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
==


