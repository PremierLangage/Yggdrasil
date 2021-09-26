#*****************************************************************************
#  Copyright (C) 2020 Emmanuel Brunache
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Emmanuel Brunache

title=Miroir d'une chaine

tag=string|char|tableau|boucle

text==#|markdown|
Écrire une fonction `retourne_chaine` qui reçoit une chaine de caractères et qui l'inverse.   
Si elle reçoit `"hello world"` elle doit la remplacer par `"dlrow olleh"`.
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

editor.code==#|c|
... retournechaine(char tab[]){
  // Votre code ici...
}

==

solution==#|c|
void retournechaine(char tab[]){
    int len=0;
    while (tab[len]!='\0'){
        len++;
    }
    char tabcopy[len];
    int i;
    for (i=0;i<len;i++){
        tabcopy[i]=tab[i];
    }
    for (i=0;i<len;i++){
        tab[i]=tabcopy[len-i-1];
    }
}
==

code_after==#|c|
int main(int argc, char* argv[]){
    retournechaine(argv[1]);
    printf("La chaine retournée est %s\n",argv[1]);
    return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["bonjour toto"], ""],
  ["Test aléatoire 1",["".join([chr(randint(97,122)) for i in range(randint(1,15))])], ""] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==
