
author=Emmanuel Brunache & Yoshihiro Shibuya

title=Longueur de chaine

tag=string|tableau|char

extends=/ComputerScience/C/template/std_progC.pl

text==

Ecrire une fonction `int motus(char mystere[],char proposition[],int info_sortie[])` qui reçoit une chaîne de caractères `mystere` à découvrir, 
une chaîne de caractères `proposition` et un tableau d'entiers `info_sortie` <u>de même taille que le mot mystère</u>.<br>
Pour chacun des i-ème caractères de la `proposition`, Le tableau `info_sortie[]` se remplit de la manière suivante :<br>
<ul>
 <li> 0 si le caractère de la proposition n'est pas dans le mot mystere.</li>
 <li> 1 si le caractère de la proposition existe dans le mot mystère mais n'est pas à la bonne place.</li>
 <li> 2 si le caractère de la proposition est à la même place dans le mot mystère.</li>
</ul>
<b>Attention :</b> Si une lettre apparaît n fois dans le mot mystère, on ne peut avoir au maximum que n chiffres différents de 0 dans `info_sortie`.<br>
<u>Par exemple </u>: si le mot `mystère` est 'bonjour' et que la `proposition` est 'oooonnn', le tableau `info_sortie` sera 1200100.<br>
<br>
Par ailleurs, la fonction renvoie `EXIT_FAILURE` si la proposition n'est pas de la même taille que le mot mystère et `EXIT_SUCCESS` sinon. 
(`EXIT_FAILURE` et `EXIT_SUCCESS` sont des constantes de la bibliothèque `stdlib.h` de valeur respective <b>0</b> et <b>1</b>)


==

code_before==

/* ancienne phrase de l'énoncée qui était invérifiable par les élèves et non vérifiée par PL : */
/* La fonction `motus` doit avoir une complexité linéaire en la longueur de la chaîne de caractères.*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define NOT_FOUND 0
#define FOUND 1
#define MATCH 2

==

editor.code==
/* <type>*/ motus(char mystere[], char proposition[], int info_sortie[])
{
  /* A compléter */
}








==

solution==
int motus(char mystere[], char proposition[], int info_sortie[])
{
    int i;
    int l_mys = strlen(mystere);
    unsigned int occ[256] = {0};
    if (l_mys != strlen(proposition)) return EXIT_FAILURE;
    /* mystere[i] est casté en (int) puisque le flag de compilation Wall*/
    /* active aussi le flag Wchar qui renvoie un warning si on utilise un */
    /* char comme indice de tableau */
    for(i = 0; i < l_mys; ++i) ++occ[(int)mystere[i]];

    for(i = 0; i < l_mys; ++i)
    {
        if(mystere[i] == proposition[i])
        {
            info_sortie[i] = MATCH;
            --occ[(int)mystere[i]];
        }
        else if ((int)occ[proposition[i]])
        {
            info_sortie[i] = FOUND;
            --occ[(int)proposition[i]];
        }
        else info_sortie[i] = NOT_FOUND;
    }

    return EXIT_SUCCESS;
}

==

code_after==
int main(int argc, char* argv[])
{
    int info_sortie[strlen(argv[1])];
    int i;
    printf("le mot mystère est: %s\n",argv[1]);
    printf("la proposition est: %s\n",argv[2]);
    if(motus(argv[1], argv[2], info_sortie) == EXIT_SUCCESS) for(i = 0; i < strlen(argv[1]); i++) printf("%d", info_sortie[i]);
    else printf("la proposition n'est pas de la bonne taille");
    return 0;
}

==

checks_args_stdin==#|python|
[
  ["simple éxécution", ["bonjour","bonsoir"],""],
  ["simple éxécution autre", ["bonjour","oooonnn"],""],
  ["semi alea taille identique",["aa".join([chr(randint(97,122)) for i in range(15)]),"aa".join([chr(randint(97,122)) for i in range(15)])],""],
  ["alea taille identique",["".join([chr(randint(97,122)) for i in range(15)]),"".join([chr(randint(97,122)) for i in range(15)])],""],
  ["alea grande taille identique",["".join([chr(randint(97,122)) for i in range(100)]),"".join([chr(randint(97,122)) for i in range(100)])],""],
  ["alea taille différente",["".join([chr(randint(97,122)) for i in range(randint(1,10))]),"".join([chr(randint(97,122)) for i in range(randint(11,15))])],""],
  ["alea géante taille identique",["".join([chr(randint(97,122)) for i in range(10000)]),"".join([chr(randint(97,122)) for i in range(10000)])],""]
]

==






















