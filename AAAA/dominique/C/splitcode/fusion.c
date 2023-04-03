

// PL:enonce==
/*
//Ecrire une fonction *fusion* qui prend deux arbres binaires de recherche en paramêtres et retourne un nouvel arbre
//qui contient tout les éléments présents dans au moins un des deux arbres. Le type d'arbre a utiliser est :
*/
typedef struct _noeud {
    struct _noeud *gauche;
    struct _noeud *droite;
    int valeur;
} Noeud,*Arbre;
// PL:==

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

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
Arbre fusion(Arbre a1, Arbre a2);
// PL:==

// PL:solution==
copy(Arbre *dest,Arbre source){
    if (source){
        *dest= nouveau_noeud(source->valeur);
    
    }
    else *dest = NULL;
}

Arbre fusion(Arbre a1, Arbre a2) {
    if (a1 == NULL) return a2;
    if (a2 == NULL) return a1;



    return result;
}
// PL:==

// PL:code_after==
int main() {
    Arbre a1 = malloc(sizeof(Noeud));
    a1->valeur = 1;
    a1->gauche = NULL;
    a1->droite = malloc(sizeof(Noeud));
    a1->droite->valeur = 3;
    a1->droite->gauche = NULL;
    a1->droite->droite = NULL;

    Arbre a2 = malloc(sizeof(Noeud));
    a2->valeur = 2;
    a2->gauche = malloc(sizeof(Noeud));
    a2->gauche->valeur = 1;
    a2->gauche->gauche = NULL;
    a2->gauche->droite = NULL;
    a2->droite = malloc(sizeof(Noeud));
    a2->droite->valeur = 3;
    a2->droite->gauche = NULL;
    a2->droite->droite = NULL;

    Arbre result = fusion(a1, a2);
    printf("%d %d %d %d\n", result->valeur, result->gauche->valeur, result->gauche->gauche == NULL, result->gauche->droite == NULL);
    printf("%d %d %d %d\n", result->droite->valeur, result->droite->gauche == NULL, result->droite->droite == NULL, result->droite->gauche == NULL ? 1 : result->droite->gauche->valeur);

    return 0;
}
// PL:==

