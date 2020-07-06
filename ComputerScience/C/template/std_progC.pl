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

#*****************************************************************************
#
# This is a re-implementation of the standard standard template of programming 
# exercice of C language.
#
# Change :
#    * tests has been renamed to checks_args_stdin
#    * use subprocess instead of use directly os and sys
#
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Standard C Programming exercise template (summer 2020)

text==
**This text shoud be overwrited when inheriting from the Standard C 
Programming exercise template.**


In this template example, we ask the user to programm a squarre function.
==

editor =: CodeEditor
editor.theme=dark
editor.language=c
# editor.height=350px

editor.code==#|c|
/* write your code here */

int carre(int n){
    return n*n;
}
==

# Place here your favorite C compiler
compiler=gcc
# PLace here the compilation flags
compil_flags=-Wall -ansi
# Place here library flags
lib_flags=


before ==#|python|
# Some globals variables
nb_attempt=0
==


form==
{{ editor|component }}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

solution==#|c|
int carre(int p){
    return p*p;
}
==

code_after==#|c|
int main(int argc, char* argv[]){
    int i, j;
    
    i = atoi(argv[1]);
    scanf(%d, &j);

    printf("Le carré de i = %d est %d\n", i, carre(i));
    printf("Le carré de j = %d est %d\n", j, carre(j));
    return 0;
}
==

evaluator==#|python|



grade=(100,f"student code:\n{editor.code}")
score, feedback = grade
==

checks_args_stdin==#|python|
[["Premier test exemple (1 et 1)", "1", "1"],
 ["Second test exemple (12 et -7)", "12", "-7"]]
==
