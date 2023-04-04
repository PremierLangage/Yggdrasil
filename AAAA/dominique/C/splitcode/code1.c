
// PL:text==
La fonction insertionTrie doit insérer un élément dans une liste en respectant l'ordre croissant des éléments.
Si l'élément est déjà présent dans la liste, il n'est pas ajouté et la fonction retourne 0. Sinon, l'élément est ajouté et la fonction retourne 1.
Le type utilisé pour les maillons est le suivant:
typedef struct _list {
    struct _list *suivant;
    int valeur;
} *List;
// PL:==
// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
// PL:==
// PL:prototype==
int insertionTrie(List *l, int v);
// PL:==
// PL:solution==
int insertionTrie(List *l, int v) {
    List new, prec, cur;
    new = (List) malloc(sizeof(struct _list));
    if (new == NULL) {
        fprintf(stderr, "Erreur : allocation de mémoire impossible.\n");
        exit(EXIT_FAILURE);
    }
    new->valeur = v;
    prec = NULL;
    cur = *l;
    while (cur != NULL && cur->valeur < v) {
        prec = cur;
        cur = cur->suivant;
    }
    if (cur != NULL && cur->valeur == v) {
        free(new);
        return 0;
    }
    new->suivant = cur;
    if (prec == NULL) {
        *l = new;
    } else {
        prec->suivant = new;
    }
    return 1;
}
// PL:==
// PL:code_after==
int main() {
    List l = NULL;
    insertionTrie(&l, 5);
    insertionTrie(&l, 3);
    insertionTrie(&l, 7);
    insertionTrie(&l, 3);
    insertionTrie(&l, 9);
    printf("Liste triée : ");
    for (List cur = l; cur != NULL; cur = cur->suivant) {
        printf("%d ", cur->valeur);
    }
    printf("\n");
    return 0;
}
// PL:==
