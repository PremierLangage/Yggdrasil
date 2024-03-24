








// PL:title= Arbres N-aire fils gauche frère droit 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

typedef struct noeud {
   int valeur;
   struct noeud * fille, * soeur;
} Noeud, * Arbre;



// PL:==

/* PL:text==
On considère la structure  suivante pour représenter un arbre N-aire:

    typedef struct noeud {
    int valeur;
    struct noeud * fille, * soeur;
    } Noeud, * Arbre;

L'idée est que chaque noeud a une fille ainée et cette fille a des soeurs 
cad des noeuds qui ont la même mère.

Vous devez écrire la fonction suivante : 

   int nombre_soeurs(Arbre a); 

Qui retourne la somme des nombres de soeurs de chaque fille ainée.


PL:== */ 


// PL:solution==

int  nombre_soeurs(Arbre a){
    int nbs=0;
    if (! a) return 0;
    nbs = nombre_soeurs(a->fille);
    Arbre s= a->soeur;
    while (s){ nbs += 1 + nombre_soeurs(s);
        s=s->soeur;
    }
    return nbs;
}


// PL:== 

/* PL:badsoluce==


int nombre_pairs(Arbre a){
    if (!a)
        return 0;
    return 1+ nombre_pairs(a->fille) + nombre_pairs(a->soeur);
}

PL:== */

// PL:code_after==


int  addTree(Arbre *a, int val){
    if (!*a){
        *a = malloc(sizeof(Noeud));
        (*a)->valeur = val;
        (*a)->fille = NULL;
        (*a)->soeur = NULL;
        return 1;
    }
    if (rand()%3==1)
        return addTree(&(*a)->fille, val);
    else
        return addTree(&(*a)->soeur, val);
}




Arbre BuildRandomTree(int n){
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = rand() % 100;
    for (int i=0; i<n; i++)
        addTree(&(a->fille), rand()%100);
    return a;
}


int main(int argc, char const *argv[])
{
    Arbre a;
    switch(atoi(argv[1])){
        case 1: 
            a = NULL;
            printf("Nombre de valeurs soeurs %d\n",nombre_soeurs(a));
            break;
        case 2:
            srand(atoi(argv[2]));
            a = BuildRandomTree(atoi(argv[3]));
            printf("Nombre de valeurs soeurs %d\n",nombre_soeurs(a));
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


