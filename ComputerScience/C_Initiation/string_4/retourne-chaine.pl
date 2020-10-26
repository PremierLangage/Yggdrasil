#author=Emmanuel Brunache

author=

title=Retourne chaine

tag=string|caractere|tableau

extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `retournechaine` qui reçoit une chaine de caractères et qui l'inverse.<br>
Si elle reçoit "hello world" elle doit la remplacer par "dlrow olleh".

==

code_before==

#include <stdio.h>
#include <stdlib.h>

==

taboo=string|strlen|strcpy

editor.code==
/* ... */  retournechaine(char tab[]){
/* A compléter */
}

==

solution==
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

code_after==

int main(int argc, char* argv[]){
    retournechaine(argv[1]);
    printf("La chaine retournée est %s\n",argv[1]);
    return 0;
}
==


checks_args_stdin==#|python|
[ ["simple éxécution", ["bonjour toto"],""],
["alea",["".join([chr(randint(97,122)) for i in range(randint(1,15))])],""]]
==















