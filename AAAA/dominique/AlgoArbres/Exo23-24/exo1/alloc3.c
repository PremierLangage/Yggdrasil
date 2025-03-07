






// PL:title= Echauffement un arbre binaire 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

typedef struct bidule {
    int a;
    double b;
} FuBar;

typedef struct _arbre {
    int taille;
    int currentSize;
    int  * filsgauche;
    int  * filsdroits;
    FuBar  ** valeurs;
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

void *clloc(size_t x, size_t y){
    ma[nbm++]=x*y;
    return calloc(x,y);
}

#define calloc clloc 
#define malloc dralloc 
#define realloc drealloc

// PL:==

/* PL:text==
On considère less structures suivantes pour représenter un arbre binaire:

    typedef struct truc FuBar; // définie dans un autre fichier.

    typedef struct _stock {
        int taille;
        int currentSize;
        int  * filsgauche;
        int  * filsdroits;
        FuBar  ** valeurs;
    } Arbre;


vous devez ecrire les deux fonctions:

- une fonction **Arbre *createTree(int n)** qui alloue un arbre de taille N 
- une fonction **Arbre \*reallocTree(Arbre *a, int n)** qui réalloue à la taille N l'arbre passé en parametre.

PL:== */ 


// PL:solution==


Arbre *createTree(int n){
    Arbre *a = (Arbre *)malloc(sizeof(Arbre));
    a->taille = n;
    a->currentSize=0;
    a->filsgauche =  (int *)calloc(n,sizeof(int)) ;
    a->filsdroits =  (int *)calloc(n,sizeof(int)) ;
    a->valeurs =  (FuBar **)calloc(n,sizeof(FuBar *)) ;
    return a;
}

Arbre *reallocTree(Arbre *a, int n){
    a->filsgauche =  (int *)realloc(a->filsgauche, n*sizeof(int)) ;
    a->filsdroits =  (int *)realloc(a->filsdroits, n*sizeof(int)) ;
    a->valeurs =     (FuBar **)realloc(a->valeurs, n*sizeof(FuBar *)) ;
    a->currentSize = n;
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


    int t[]={32, 40, 40, 80, 80, 80, 160, 0, 0, 0, };


    if (ma[0]!=sizeof(Arbre)){
        printf("Erreur d'allocation 1\n");
        exit(1);
    }
    for(int i=1;i<4;i++){
        if (ma[i]!=t[i]){
        printf("Erreur d'allocation 2 %d\n",ma[i]);
        exit(1);
        }
    }
    a = reallocTree(a,20);
    for(int i=4;i<7;i++){
        if (ma[i]!=t[i]){
        printf("Erreur de réallocation 3\n");
        exit(1);
        }
    }

    printf("Allocation correcte\n");
    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test allocation" ,[],""]]
PL:== */


