




// PL:title= Echauffement un arbre binaire 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>


typedef struct noeud {
   int f,g;
} Noeud;

typedef struct _arbre {
    int taille;
   Noeud * noeuds;
} Arbre;



int nbm=0;
int ma[100];
void* dralloc(int n){
    ma[nbm++]=n;
    return (void *) malloc(n);
}
void *drealloc(void *p, int n){
    ma[nbm++]=n;
    return realloc(p,n);
}

void *cdrealloc(size_t x, size_t y){
    ma[nbm++]=x*y;
    return calloc(x,y);
}

#define calloc cdralloc 
#define malloc dralloc 
#define realloc drealloc

// PL:==

/* PL:text==
On considère les structures suivantes pour représenter un arbre binaire:

    typedef struct noeud {
    int f,g;
    } Noeud;

    typedef struct _arbre {
    int taille;
    Noeud * noeuds;
    } Arbre;


vous devez seulement ecrire :

- une fonction **Arbre *createTree(int n)** qui alloue un arbre de taille N 
- une fonction **Arbre \*reallocTree(Arbre *a, int n)** qui réalloue à la taille N l'arbre passé en parametre.

PL:== */ 


// PL:solution==


Arbre *createTree(int n){
    Arbre *a = (Arbre *)malloc(sizeof(Arbre));
    a->taille = n;
    a->noeuds = (Noeud *)malloc(n*sizeof(Noeud));
    return a;
}

Arbre *reallocTree(Arbre *a, int n){
    a->noeuds = (Noeud *)realloc(a->noeuds,n*sizeof(Noeud));
    a->taille = n;
    return a;
}

// PL:== 

/* PL:badsoluce==


Arbre *createTree(int n){
    Arbre *a =0;
    return a;
}

Arbre *reallocTree(Arbre *a, int n){
    return a;
}

PL:== */

// PL:code_after==
int main(int argc, char const *argv[])
{
    Arbre *a = createTree(10);
    a = reallocTree(a,20);
    if (ma[0]!=sizeof(Arbre) || ma[1]!=10*sizeof(Noeud) || ma[2]!=20*sizeof(Noeud)){
        printf("Erreur d'allocation \n");
    }
    else{
        printf("Allocation correcte\n");
    }
    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test allocation" ,[],""]]
PL:== */


