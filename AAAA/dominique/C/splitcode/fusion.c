

// PL:enonce==
/*
Ecrire une fonction *fusion* qui prend deux arbres binaires de recherche en paramêtres et retourne un nouvel arbre
qui contient tout les éléments présents dans au moins un des deux arbres. Le type d'arbre a utiliser est :
```
typedef struct _noeud {
    struct _noeud *gauche;
    struct _noeud *droite;
    int valeur;
} Noeud,*Arbre;
```


// PL:==
*/
// PL:code_before==
#include <stdio.h>
#include <stdlib.h>

typedef struct _noeud {
    struct _noeud *gauche;
    struct _noeud *droite;
    int valeur;
} Noeud,*Arbre;


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

int insertion(Arbre *a,int valeur) {
    if (*a == NULL) {
        *a = nouveau_noeud(valeur);
        return 1;
    }
    if (valeur == (*a)->valeur) {
        return 0;
    }
    if (valeur < (*a)->valeur) {
        return insertion(&(*a)->gauche,valeur);
    }
    return insertion(&(*a)->droite,valeur);
 }

Arbre lireArbre(){
    Arbre a; int i;
    while (scanf("%d",&i)==1){
        insertion(&a,i);
    }
    while (scanf("%c",&i)==1){
        if (i=='|') break;
        if (i == EOF) break;
    }
    return a;
}


// PL:==

// PL:prototype==
Arbre fusion(Arbre a1, Arbre a2);
// PL:==

// PL:solution==
copy(Arbre *dest,Arbre source){
    //if (source) printf("copy: %d",source->valeur);
    if (source){
        insertion(dest,source->valeur);
        copy(dest, source->gauche);
        copy(dest,source->droite);
    }
    
}

Arbre fusion(Arbre a1, Arbre a2) {
    Arbre a = NULL;
    copy(&a,a1);
    copy(&a,a2);
    return a;
}
// PL:==

// PL:code_after==
int main() {
    Arbre a = lireArbre();
    Arbre b = lireArbre();
    printf("\nArbre 1:");
    afficher_arbre(a,0);
    printf("\nArbre 2:");
    afficher_arbre(b,0);
    printf("\nArbre fusion:");
    afficher_arbre(fusion(a,b),0);
    return 0;
}
// PL:==
/*
// PL:Inputs==
5 6 7 8 910 12 34 77 | 19 76 54 39 29 8 9
1 2 3 4 5 6 7 8 9 10 | 19 10 9 8 7 6 5 4 3 2 1
==
*/