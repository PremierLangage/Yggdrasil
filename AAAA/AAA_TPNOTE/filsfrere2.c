








// PL:title= Arbres N-aire fils gauche frère droit 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

typedef struct noeud {
   int valeur;
   struct noeud * fils, * frere;
} Noeud, * Arbre;



// PL:==

/* PL:text==
On considère la structure  suivante pour représenter un arbre N-aire:

    typedef struct noeud {
    int valeur;
    struct noeud * fils, * frere;
    } Noeud, * Arbre;

L'idée est que chaque noeud a un fils ainé et ce fils a des frères cad des noeuds qui ont le même père.

vous devez ecrire la fonction suivante :   ** int hauteur(Arbre a); **

Qui retourne la plus grande distance entre une feuille et la racine.
La branche de la famille avec le plus de générations.


PL:== */ 


// PL:solution==

int hauteur(Arbre a){
    int g, d;
    if (!a)
        return -1;
    g = hauteur(a->fils);
    Arbre f = a->frere;
    int max= -1;
    while (f){
        d = hauteur(f->frere);
        if (d > max)
            max = d;
        f = f->frere;
    }
    return 1 + ((g > max)? g: max);
}


// PL:== 

/* PL:badsoluce==


int hauteur(Arbre a){
    int g, d;
    if (!a)
        return -1;
    g = hauteur(a->fils);
    d = hauteur(a->frere);
    return 1 + ((g > d)? g: d);
}
PL:== */

// PL:code_after==


int  addTree(Arbre *a, int val){
    if (!*a){
        *a = malloc(sizeof(Noeud));
        (*a)->valeur = val;
        (*a)->fils = NULL;
        (*a)->frere = NULL;
        return 1;
    }
    if (rand()%2)
        return addTree(&(*a)->fils, val);
    else
        return addTree(&(*a)->frere, val);
}




Arbre BuildRandomTree(int n){
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = rand() % 100;
    for (int i=0; i<n; i++)
        addTree(&(a->fils), rand()%100);
    return a;
}


int main(int argc, char const *argv[])
{
    Arbre a;
    switch(atoi(argv[1])){
        case 1: 
            a = NULL;
            printf("Hauteur d'un arbre vide %d\n",hauteur(a));
            break;
        case 2:
            srand(atoi(argv[2]));
            a = BuildRandomTree(atoi(argv[3]));
            printf("Hauteur d'un arbre %d\n",hauteur(a));
            break;
    }

}
// PL:==


/* PL:checks_args_stdin==
[["Test vide" ,["1"],""],
["Test pas grand" ,["1","1111","2"],""],
["Test plus grand" ,["1","111","100"],""],
["Test encore plus grand" ,["1","111","1000"],""],
]
PL:== */


