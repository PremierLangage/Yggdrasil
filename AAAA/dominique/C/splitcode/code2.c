
// PL:text==
La fonction insertion dans un arbre binaire de recherche utilisant le type de noeud suivant:
typedef struct _noeud {
    struct _noeud *gauche;
    struct _noeud *droite;
    int valeur;
} Noeud,*Arbre;
// PL:==

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

// définition du type Noeud
typedef struct _noeud {
    struct _noeud *gauche;
    struct _noeud *droite;
    int valeur;
} Noeud, *Arbre;

// définition de la fonction d'affichage d'un arbre binaire
void afficher_arbre(Arbre a, int niveau) {
    if (a == NULL) {
        return;
    }
    afficher_arbre(a->droite, niveau + 1);
    for (int i = 0; i < niveau; i++) {
        printf("    ");
    }
    printf("%d\n", a->valeur);
    afficher_arbre(a->gauche, niveau + 1);
}

// fonction pour allouer un nouveau noeud
Noeud* nouveau_noeud(int valeur) {
    Noeud* n = (Noeud*)malloc(sizeof(Noeud));
    n->gauche = NULL;
    n->droite = NULL;
    n->valeur = valeur;
    return n;
}



// PL:==

// PL:prototype==
void insertion(Arbre *a, int valeur);
// PL:==

// PL:solution==
void insertion(Arbre *a, int valeur) {
    if (*a == NULL) {
        *a = nouveau_noeud(valeur);
        return;
    }

    if (valeur < (*a)->valeur) {
        insertion(&(*a)->gauche, valeur);
    } else if (valeur > (*a)->valeur) {
        insertion(&(*a)->droite, valeur);
    }
}
// PL:==

// PL:code_after==
int main() {
    // création d'un arbre binaire vide
    Arbre a = NULL;

    // insertion de quelques valeurs
    insertion(&a, 10);
    insertion(&a, 5);
    insertion(&a, 15);
    insertion(&a, 7);
    insertion(&a, 13);

    // affichage de l'arbre binaire
    afficher_arbre(a, 0);

    // libération de la mémoire allouée pour l'arbre binaire
    return 0;
}
// PL:==
