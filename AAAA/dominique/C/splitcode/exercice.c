
/* PL:title= Analyse d'une suite d'entiers. */
/* PL:text==

Ecrire une fonction *exo* qui ne prend pas de paramètre et ne renvoie rien.

Votre fonction exo doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher "croissante", "décroissante","constante", "indéterminée" en fonction de la proprété correspondante 
de la suite des entiers possitifs lus.

Pour une suite constante n'affichera que "constante".

Si la suite d'entier est vide affiche "indéterminée". 

N'oubliez pas le caractère "\n" en fin de ligne.

Exemple avec les valeurs 55 77 99 1000   
le programme affiche  
croissante   



PL:== */


// PL:code_before==
#include <stdio.h>



// PL:==
// PL:solution==

void exo(){
    //char *stab[]={"croissante", "décroissante","constante", "indéterminée"};
    int n;
    int l;
    int croissante=1;
    int decroissante=1;
    int constante=1;
    scanf("%d",&l);
    if (l <0){
        printf("indéterminée\n");
        return;
    }
    while (scanf("%d",&n)==1 && n>0)
    {
        if (n > l){
            decroissante=0;
        }
        if (n < l){
            croissante=0;
        }   
        if (n != l){
            constante=0;
        }   
        l=n;
    }
    if (croissante)
        printf("croissante\n");
    else if (decroissante)
        printf("décroissante\n");
    else if (constante)
        printf("constante\n");
    else
        printf("indéterminée\n");
}

// PL:==

/* PL:code==
void exo(){
// "croissante", "décroissante","constante", "indéterminée"

}

PL:== */

// PL:code_after==

int main(){
    exo();
    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["Test  Croissant ", [], "3 4 5 6 7 7 67 88 263 -2"],
["Test  Décroissant ", [], "263 134 121 111 98 87 65 43 21 -2"],
]
PL:== */