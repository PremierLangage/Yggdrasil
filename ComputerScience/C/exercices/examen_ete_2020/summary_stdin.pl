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
title=Résumer le contenu de l'entrée standard
tag=programm|input_output|function|type|difficile

text==
Écrire un programme C qui analyse son entrée standard pour en proposer un très 
rapide résumé. Quelle que soit la longueur de l'entrée standard, votre 
programme devra compter les nombres et les mots comme il suit:

    STDIN <-- "mot 123 autremot 54"
    nombres: 2
    mots: 2

On considéra les espaces, les tabulations et les retours chariots comme 
délimiteurs. Les nombres sont composés de chiffres uniquement (`[0-9]`) et 
peuvent possiblement commencer par des zéros. L'entrée standard sera 
composée uniquement de mots en lettres minuscules, de nombres ainsi que 
de délimiteurs (uniques ou multiples) les séparants. Les mots ou nombres 
ne comporteront jamais plus de 20 caractères.
==

editor.code==#|c|
#include ...

int main(...){
  ...
}
==

solution==#|c|
#include <stdio.h>

int is_delim(char c){
  if ((c == ' ') || (c == '\t') || (c == '\n'))
    return 1;
  return 0;
}

int is_digit(char c){
  if ((c >= '0') && (c <= '9'))
    return 1;
  return 0;
}

int main(int argc, char* argv[]){
  int nb_c=0, nb_mot=0;
  char prev_delim = 1;
  char c;

  while((c = getchar()) != EOF){
    if (is_delim(c)){
      prev_delim = 1;
    }
    else{
      if (prev_delim){
        if (is_digit(c))
          nb_c += 1;
        else
          nb_mot += 1;
      }
      prev_delim = 0;
    }
  }

  printf("nombres: %d\n", nb_c);
  printf("mots: %d\n", nb_mot);
  return 0;
}
==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Exécution simple", [], "mot 123 autremot 54"],
 ["Test aléatoire 1", [], ''.join(list(map(lambda x: x+''.join([choice([' ','\t','\n']) for i in range(randint(1,5))]), [choice([''.join([chr(randint(48,57)) for k in range(randint(1, 10))]), ''.join([chr(randint(97,122)) for j in range(randint(1,20))])]) for i in range(randint(1,10))])))],
 ["Test aléatoire 2", [], ''.join(list(map(lambda x: x+''.join([choice([' ','\t','\n']) for i in range(randint(1,5))]), [choice([''.join([chr(randint(48,57)) for k in range(randint(1, 10))]), ''.join([chr(randint(97,122)) for j in range(randint(1,20))])]) for i in range(randint(10,20))])))],
 ["Test aléatoire 3", [], ''.join(list(map(lambda x: x+''.join([choice([' ','\t','\n']) for i in range(randint(1,5))]), [choice([''.join([chr(randint(48,57)) for k in range(randint(1, 10))]), ''.join([chr(randint(97,122)) for j in range(randint(1,20))])]) for i in range(randint(20,30))])))],
 ["Test aléatoire 4", [], ''.join(list(map(lambda x: x+''.join([choice([' ','\t','\n']) for i in range(randint(1,5))]), [choice([''.join([chr(randint(48,57)) for k in range(randint(1, 10))]), ''.join([chr(randint(97,122)) for j in range(randint(1,20))])]) for i in range(randint(30,40))])))],
 ["Test aléatoire 5", [], ''.join(list(map(lambda x: x+''.join([choice([' ','\t','\n']) for i in range(randint(1,5))]), [choice([''.join([chr(randint(48,57)) for k in range(randint(1, 10))]), ''.join([chr(randint(97,122)) for j in range(randint(1,20))])]) for i in range(randint(40,50))])))],]
==


