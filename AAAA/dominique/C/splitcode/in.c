


/* PL:title= Une chaine dans une autre  */
/* PL:text==

Ecrire une fonction **in** qui prend deux chaines de caratères en parametre (dans cet ordre) *val* et *text*.

Celle-ci vérifiera si la chaine *val* apparait dans la chaine *text*.
Votre fonction retournera 1 si c'est le cas, 0 sinon.

Par convention, la chaine vide "" apparait toujours dans une autre chaine.
<br />
<br />

**Exemples :**

*in("script", "souscripteur")* renverra *1*.

*in("dit", "ordinateur")* renverra *0*.
PL:== */


// PL:code_before==
#include <stdio.h>
#include <string.h>


// PL:==
// PL:solution==

// la fonction isprefix retourne 1 si la chaine p est un prefixe de la chaine t, 0 sinon.
int isprefix(char *p, char *t){
    while (*p!='\0' && *t!='\0'){
        if (*p!=*t){
            return 0;
        }
        p++;
        t++;
    }
    return 1;
}
// la fonction in retourne 1 si la chaine t apparait dans la chaine e, 0 sinon.

int in( char *t,  char *e){
    while (*e!='\0'){
        if (isprefix(t,e)){
            return 1;
        }
        e++;
    }
    return 0;
}

// PL:==

/* PL:code==
void in(...,...){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==

int main(int argc, char **argv){
    printf("in(\"%s\",\"%s\")=%d\n",argv[1],argv[2],in(argv[1],argv[2]));
    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["Test simple, ["as","qjskhdfkjqshfls has jjj"], ""],
["Test pas plus dur ", ["kkkkkkkkk","kkkkkkkkkkkkkkkkkkkk"], ""],
["Test mot plus long que le text ", ["abscdefghjkil","abscdefghjk"], ""],]
PL:== */