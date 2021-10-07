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

taboo=strlen|string.h

editor.code==#|c|
... retourne_chaine(char s[]){
  // Votre code ici...
}
==

solution==#|c|
void retourne_chaine(char tab[]){
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
    retourne_chaine(argv[1]);
    printf("La chaine retournée est %s\n",argv[1]);
    return 0;
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["bonjour toto"], ""],
  ["Palindrome", [choice(["radar", "elle", "laval", "coloc", "kayak", "rotor"])], ""],
  ["Test aléatoire 1",["".join([chr(randint(97,122)) for i in range(randint(1,15))])], ""],
  ["Test aléatoire 2",["".join([chr(randint(97,122)) for i in range(randint(5,20))])], ""],
  ["Test aléatoire 3",["".join([chr(randint(97,122)) for i in range(randint(10,25))])], ""] ]
==

astuces==#|python|
[
  { "content": """Il faut connaitre la longueur de la chaîne pour ensuite opérer son miroir."""},
  { "content": """Une fois la longueur connue, il faut refaire une demi-boucle (une boucle qui s'arrête au milieu) pour échanger deux à deux les lettres."""},
  { "content": """Pour procéder à un échange de deux lettres, il faut utiliser une variable locale temporaire supplémentaire."""}
]
==
