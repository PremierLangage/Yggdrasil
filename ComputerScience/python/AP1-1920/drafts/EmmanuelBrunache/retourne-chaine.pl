author=Emmanuel Brunache


title=Retourne chaine

tag=string

extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `retourne` qui reçoit deux chaines de caractères et met dans la deuxième chaine la premiere chaine de caractère à l'envers.
==
code_before==

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

==

taboo=string.h

editor.code==
/* ... */  retournechaine(char tab[],char bat[]){
/* A compléter */
}

==

solution==
void retournechaine(char tab[]){
    int i;
    int longueur=strlen(tab);
    char bat[strlen(tab)];
    strcpy(bat,tab);
    for (i=0;i<longueur;i++){
        bat[i]=tab[longueur-i-1];
    }
    strcpy(tab,bat);
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












