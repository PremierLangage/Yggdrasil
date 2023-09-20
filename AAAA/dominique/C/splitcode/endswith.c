



/* PL:title= La fin d'une chaine */
/* PL:text==

Ecrire une fonction **endswith** qui prend deux chaine en parametre: text, ext.
Qui vérifie si oui on non la chaine text se termine par la chaine ext.
Votre fonction retourne 1 si c'est le cas, 0 sinon.
PL:== */


// PL:code_before==
#include <stdio.h>



// PL:==
// PL:solution==

// la fonction endswith retourne 1 si la chaine t se termine par la chaine e, 0 sinon.
int endswith(const char *t, const char *e){
    int i=0;
    int j=0;
    while (t[i]!='\0'){
        i++;
    }
    while (e[j]!='\0'){
        j++;
    }
    if (j>i){
        return 0;
    }
    while (j>0){
        if (t[i]!=e[j]){
            return 0;
        }
        i--;
        j--;
    }
    return 1;

}

// PL:==

/* PL:code==
void exo(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==

int main(int argc, char **argv){
    printf("endswith(\"%s\",\"%s\")=%d\n",argv[1],argv[2],endswith(argv[1],argv[2]));
    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["Test simple, ["test.c",".c"], ""],
["Test pas plus dur ", ["test.cxp",".cxp"], ""],
["Test trop longue extension ", ["test.cxp","finalementtest.cxp"], ""],]
PL:== */