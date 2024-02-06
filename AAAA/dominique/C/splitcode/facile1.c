

/* PL:title= Facile  */
/* PL:text==

Ecrire une fonction **printRoot** qui  prend en paramètre un flottant et 3 entiers (dans cet ordre) et qui retourne un flottant.
 



PL:== */



/* PL:beforeB==

varval='valeur'
varfg='fils_gauche'
varfd='fils_droit'
varnoeud='Noeud'

code_before=f'''
#include <stdio.h>
#include <stdlib.h>


#define VALEUR {varval}
#define FG  {varfg}
#define FD  {varfd}
#define NOEUD {varnoeud}

typedef struct NOEUD {
    int VALEUR;
    struct NOEUD *FG;
    struct NOEUD *FD;
} NOEUD;

typedef struct NOEUD *ARBRE;
'''
text+= code_before

PL:== */

// PL:initial_code==
// this code is for testing purpose it doesn't appear in the student version
#include <stdio.h>
#include <stdlib.h>
typedef struct NOEUD {
    int VALEUR;
    struct NOEUD *FG;
    struct NOEUD *FD;
} NOEUD;

typedef struct NOEUD *ARBRE;
// PL:==


// PL:solution==

void  printroot(ARBRE a){
    if (a == NULL) return;
    printf("%d\n",a->VALEUR);
}

// PL:==

/* PL:code==
void eval_f(){
    
printf("Plus longue partie constante %d\n",...);
printf("Plus longue partie croissante %d\n",...);

}

PL:== */

// PL:code_after==

// Fonctions outils pour tester les abres binaires 
ARBRE creer_noeud(int v, ARBRE fg, ARBRE fd){
    ARBRE a = (ARBRE)malloc(sizeof(NOEUD));
    a->VALEUR = v;
    a->FG = fg;
    a->FD = fd;
    return a;
}

ARBRE construit_arbre_aleatoire(int n, int mode){
    if (n == 0) return NULL;
    if (mode & 1) {
    if (n==1) return creer_noeud(rand()%100, NULL, NULL);
    int r = rand() % (n /2) ;
    return creer_noeud(rand()%100,construit_arbre_aleatoire(r,mode),construit_arbre_aleatoire(n-r-1, mode));
    }
    if( mode & 2) {
    return creer_noeud(rand()%100, construit_arbre_aleatoire(n-1,mode), NULL);
    }
    if( mode & 4) {
    return creer_noeud(rand()%100, NULL,construit_arbre_aleatoire(n-1,mode));
    }
    return NULL;
}




void afficheTest(ARBRE a, int n){
    if (a == NULL) return;
    if (n & 1) printf("%d ",a->VALEUR);
    afficheTest(a->FG, n);
    if (n & 2) printf("%d ",a->VALEUR);
    afficheTest(a->FD, n);
    if (n & 4) printf("%d ",a->VALEUR);
}


void dotest(int taille, int mode){
    ARBRE a = construit_arbre_aleatoire(taille,mode) ;
    printf("Arbre ");
    if (mode & 1) printf("aleatoire ");
    if (mode & 2) printf("gauche ");
    if (mode & 4) printf("droit ");
    afficheTest(a, 1);
    printf("\n");
}
int seed;
int main(int c, char **argv){
    seed =  argv[1] ? atoi(argv[1]) : 42;
    srand(seed);
    printroot(construit_arbre_aleatoire(10,1));
    printroot(construit_arbre_aleatoire(10,1));
    

    return 0;
}


// PL:==

/* PL:checks_args_stdin==
[["Test 1", ["11"], ""],
["Test Yveline", ["78"], ""],
]
PL:== */