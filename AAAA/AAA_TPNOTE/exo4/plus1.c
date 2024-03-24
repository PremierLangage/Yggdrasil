




// PL:title= Plus dur


// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
typedef struct noeud {
   int valeur;
   struct noeud * fg, * fd;
} Noeud, * Arbre;


Arbre cn(int val,Arbre g,Arbre d){
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = val;
    a->fg = g;
    a->fd = d;
    return a;
}



int  addTree(Arbre *a, int val){
    if (!*a){
        *a = malloc(sizeof(Noeud));
        (*a)->valeur = val;
        (*a)->fg = NULL;
        (*a)->fd = NULL;
        return 1;
    }
    if (rand()%2)
        return addTree(&(*a)->fg, val);
    else
        return addTree(&(*a)->fd, val);
}

Arbre _BuildRandomTree(int *n){
    if (*n < 0)
        return NULL;
    Arbre a = calloc(sizeof(Noeud),1);
    a->valeur = rand() % 1000;
    (*n) -= 1;
    if (rand() % 2)
        a->fg = _BuildRandomTree(n);
    if (rand() % 2)
        a->fd = _BuildRandomTree(n);
  

    return a;
}

Arbre BuildRandomTree(int n){
     int v=n;
    Arbre a= _BuildRandomTree(&v);
    while (v > 0){
        v -= addTree(&a,rand() % 1000);
    }
    return a;
}

Arbre BuildRandomStrictlyBinaryTree(int n){
    if (n <= 0)
        return NULL;
    Arbre a = malloc(sizeof(Noeud));
    a->valeur = rand() % 100;
    a->fg = BuildRandomStrictlyBinaryTree((n-1)/2);
    a->fd = BuildRandomStrictlyBinaryTree((n-1)/2);
    return a;
}

Arbre BuildTree(int n, int strict){
    if (! strict && (rand() % 10 > 3))
        return BuildRandomTree(n);
    //printf(" S");
    return BuildRandomStrictlyBinaryTree(n);
}

void printTree(Arbre a){
    if (!a)
        printf("X ");
    else {
    printf("%d ", a->valeur);
    printTree(a->fg);
    printTree(a->fd);
    }
}

// PL:==

/* PL:text==
On considère la structure suivante :

    typedef struct noeud {
    int val;
    struct noeud * fg, * fd;
    } Noeud, * Arbre;

Remarque: dans certains test la fonction 

    void printTree(Arbre a){
        if (!a)
            printf("X ");
        else {
        printf("%d ", a->valeur);
        printTree(a->fg);
        printTree(a->fd);
        }
    }

est utilisé pour afficher les arbres. 

PL:== */ 

/* PL:text1==
Écrire une fonction **int plus_courte_branche(Arbre a)** 
qui renvoie la longueur de la branche la plus courte de l'arbre.
PL:== */ 
// PL:sol1==
int plus_courte_branche(Arbre a){
   int g, d;
   if (!a)
       return -1;
    if(!a->fg && !a->fd)
        return 0;
   g = plus_courte_branche(a->fg);
   d = plus_courte_branche(a->fd);
   if (-1 == d) /* Une feuille ou un unique fils gauche */
       return g + 1;
   if (-1 == g) /* Un unique fils droit */
       return d + 1;
   return 1 + ((g < d)? g: d); /* Deux fils */
}
// PL:== 
/* PL:text2==
Écrire une fonction **int affiche_hauteur(Arbre a, int h)** 
qui affiche les noeuds de l'arbre à la hauteur h.
Hauteur = distance aux feuilles. 
PL:== */ 
// PL:sol2==
int affiche_hauteur(Arbre a, int h){
   int g, d, lh;
   if (!a){
       return -1;
   }
   g = affiche_hauteur(a->fg, h);
   d = affiche_hauteur(a->fd, h);
   lh = 1+ ((g > d)? g: d);
   if (h == lh)
       printf("%d ", a->valeur);
    return lh;
}
// PL:== 

/* PL:text3==
Écrire une fonction **void affiche_niveau(Arbre a, int n)**
qui affiche les noeuds de l'arbre au niveau n.
PL:== */ 
// PL:sol3==
void affiche_niveau(Arbre a, int n){
   if (!a || n < 0)
       return ;
   if (n == 0){
       printf("%d ", a->valeur);
       return ;
   }
   affiche_niveau(a->fg, n - 1);
   affiche_niveau(a->fd, n - 1);
}

// PL:== 
/* PL:text4==
Ecrire la fonction **int est_complet(Arbre a)** qui renvoie 1 si l'arbre est complet, 0 sinon.

On appellera arbre binaire complet tout arbre qui est localement complet et dont toutes les feuilles ont la même profondeur.
Un arbre est localement complet si il n'a pas de noeuds avec un seul fils.

PL:== */
// PL:sol4==
int est_complet_aux(Arbre a){
   int g, d;
   if (!a)
       return -1;
   g = est_complet_aux(a->fg);
   d = est_complet_aux(a->fd);
   if (g == -2 || d == -2 || g != d)
       return -2;
   return d + 1;
}
int est_complet(Arbre a){
   return est_complet_aux(a) != -2;
}

// PL:== 

// PL:code_after==

Arbre unArbre(){
    return cn(10,// Noeud a 2 fils Niveau 0 Hauteur 3
            cn(5,// Noeud a 2 fils Niiveau 1 Hauteur 2
                cn(3,cn(1,NULL,NULL),NULL), // un fils + une feuille Niveau 2 et 3
                cn(7,NULL,NULL)), // une feuille Niveau 2 Hauteur 0 
            cn(15, // Noeud a 2 fils Niveau 1 Hauteur 1
                cn(12,NULL,NULL), // une feuille    Niveau 2 Hauteur 0
                cn(20,NULL,NULL))  // une feuille   Niveau 2 Hauteur 0
                );
}



int main(int argc, char const *argv[])
{

    if (argc < 2){
        printf("Usage: %s <seed>\n",argv[0]);
        return 1;
    }
    srand(atoi(argv[1]));
    int taille=1;
    int i=atoi(argv[1]);
    Arbre a=NULL;
    if (i==0) a= NULL;
    else if (i==1) a= unArbre();
    else a = BuildTree(taille * (5*i),i % 2);

   if (taille < 20) 
    { printf("\nArbre °%d parcours préfixe : ",i);
     printTree(a);
     printf("\n");
    }
    

            printf("\nArbre °%d Taille %d ",i, taille);
            printf("\nHauteur %d : ",i);
            affiche_hauteur(a,i);


printf("\n");
    return 0;
}

// PL:==


/* PL:checks_args_stdin==
[["Test arbre vide " ,["1"],""], ["Test 8 Noeud" ,["2"],""],["Test 125" ,["3"],""],["Test plus" ,["4"],""]]
PL:== */


/* PL:aftersplit==
import random
VERSION=2


solution = globals()["sol"+str(VERSION)]

text += globals()["text"+str(VERSION)]
statement = text

PL:== */

