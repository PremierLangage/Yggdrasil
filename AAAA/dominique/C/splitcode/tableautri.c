


/* PL:title= Tableau Trie  */
/* PL:text==

Ecrire une fonction ajoutTrie(int *tab,int nbe, int valeur)
qui ajoute la valeur dans le tableau trié tab de taille TAILLE contenant nbe déjà nbe elements.

On suppose que l'on a definie TAILLE comme suit:
 \#define TAILLE 341

Si nbe == TAILLE, la fonction ne fait rien et retourne 0.
Sinon la valeur est insérée dans le tableau de sorte que le tableau reste trié en ordre croissant
dans ce cas la fonction retourne 1.

PL:== */

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
#ifndef TAILLE
#define TAILLE 1000
#endif
// PL:==
// PL:solution==

int ajoutTrie(int *tab, int nbe, int valeur)
{
    if (nbe == TAILLE)
    {
        return 0;
    }
    int i = 0;
    while (i < nbe && tab[i] < valeur)
    {
        i++;
    }
    for (int j = nbe; j > i; j--)
    {
        tab[j] = tab[j - 1];
    }
    tab[i] = valeur;
    return 1;
}

// PL:==

/* PL:code==
int ajoutTrie(int *tab,int nbe, int valeur) {}

PL:== */

// PL:code_after==

void printTab(int *t, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d ", t[i]);
    }
    printf("\n");
}

int main(int c, char **v)
{
    int n;
    int i = 0;
    int tab[TAILLE];
    while (scanf("%d", &n) == 1)
    {
        i += ajoutTrie(tab, i, n);
        if (i % 7 == 0)
            printTab(tab, i);
    }
    return 0;
}
// PL:==

/* PL:checks_args_stdin==
[["Test 1", ["11"], "5 4 7 190 8 14 17 16 161 16 16 13 11"],
["Test Yveline", ["78"], "4 538 98 876 65 54 43 1 883 8 798739 66 23 14 17 98 900 1000 12"],

]
PL:== */
