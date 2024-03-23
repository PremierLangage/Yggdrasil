





// PL:title= Echauffement un arbre binaire 


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>


typedef struct _arbre {
    int taille;
    int currentSize;
    int  * filsgauche;
    int  * filsdroits;
    int  * valeurs;
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
On considère la structure suivantes pour représenter un arbre binaire:


    typedef struct _arbre {
        int taille;
        int currentSize;
        int  * filsgauche;
        int  * filsdroits;
        int  * valeurs;
    } Arbre;


vous devez seulement ecrire :

- une fonction **Arbre *createTree(int n)** qui alloue un arbre de taille N 
- une fonction **Arbre \*reallocTree(Arbre *a, int n)** qui réalloue à la taille N l'arbre passé en parametre.

PL:== */ 


// PL:solution==


Arbre *createTree(int n){
    Arbre *a = (Arbre *)malloc(sizeof(Arbre));
    a->taille = n;
    a->current=0;
    a->filsgauche =  (int *)calloc(n,sizeof(Arbre)) ;
    a->filsdroits =  (int *)calloc(n,sizeof(Arbre)) ;
    a->valeurs =  (int *)calloc(n,sizeof(Arbre)) ;
    return a;
}

Arbre *reallocTree(Arbre *a, int n){
    a->filsgauche =  (int *)realloc(a->filsgauche, n*sizeof(Arbre)) ;
    a->filsdroits =  (int *)realloc(a->filsdroits, n*sizeof(Arbre)) ;
    a->valeurs =     (int *)realloc(a->valeurs, n*sizeof(Arbre)) ;
    a->current = n;
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
    if (ma[0]!=sizeof(Arbre))
        printf("Erreur d'allocation \n");
        exit(1);
    }
    for(int i=1;i<4;i++){
        if (ma[i]!=sizeof(int)*10)
        printf("Erreur d'allocation \n");
        exit(1);
    }
    for(i=4;i<7;i++){
        if (ma[i]!=sizeof(int)*20)
        printf("Erreur d'allocation \n");
        exit(1);
    }

    printf("Allocation correcte\n");
    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test allocation" ,[],""]]
PL:== */


