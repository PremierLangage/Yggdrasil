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
title=Manipuler un tableau de pointeurs de fonctions
tag=function|type|pointeur|function_pointer|difficile

editor.height=350px

before ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=["-lm"]

if "taboo" in globals(): 
    text+='<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    text+="<b>Taboo :</b> attention, il y aura un refus de compilation si vous proposez un code qui utilise les mots suivants (ne les mentionnez pas ni en fonction, ni en nom de variable) : "
    text+=str(taboo)
    text+='</div> <br />\n'

text+=" {{ editor|component }} "
==

text==
Écrire une fonction C **print_all_functions** qui prend en argument un tableau
de fonctions, la taille de ce tableau et un point d'évaluation (un réel positif) 
de type **double**. Le but sera d'afficher toutes les fonctions évaluées au point
d'évaluation en argument.

<br>

Pour chaque élément-fonction du tableau, votre fonction devra afficher le nom de la 
fonction (champ `name`), le point d'évaluation placé entre paranthèses et la valeur de la 
fonction sur le point d'évaluation (il faudra ici utiliser le pointeur de fonction dans le 
champs `func`). Comme on travaille avec des doubles, l'écriture formatée à générer pour 
chaque élément-fonction est 

    "%s(%g) = %g\n"

Votre fonction devra donc produire autant de lignes qu'il y a de fonctions dans
le tableau.
==


editor.code==#|c|
typedef double(*R_func)(double);

typedef struct real_func{
  char* name;
  R_func func;
}Function;

void print_all_functions(Function t[], int size, double point){
  /* Votre code ici... */
}
==

solution==#|c|
typedef double(*R_func)(double);

typedef struct real_func{
  char* name;
  R_func func;
}Function;

void print_all_functions(Function t[], int size, double point){
  int i;

  for (i=0 ; i<size ; i++){
    printf("%s(%g) = %g\n", t[i].name, point, t[i].func(point));
  }
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
==

code_after==#|c|
static Function tab[] = { {"sqrt", sqrt},
                          {"ln", log},
                          {"cosinus", cos},
                          {"exp", exp},
                          {"arctan", atan},
                          {"sinus hyperbolique", sinh} };

static int nb_func = 6;

int main(int argc, char* argv[]){
  double p=strtod(argv[1], NULL);
  print_all_functions(tab, nb_func, p);
  return 0;
}
==

checks_args_stdin==#|python|
[["Évaluation en zéro", ["0"], ""],
 ["Évaluation en un", ["1"], ""],
 ["Test aléatoire 1", [str(10*random())], ""],
 ["Test aléatoire 2", [str(10*random())], ""],
 ["Test aléatoire 3", [str(10*random())], ""],
 ["Test aléatoire 4", [str(10*random())], ""],
 ["Test aléatoire 5", [str(10*random())], ""] ]
==

