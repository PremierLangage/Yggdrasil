

/* PL:title= tableau de pascal  */
/* PL:text==

Ecrire une fonction **void pascal(int n)** qui affiche le tableau de pascal de taille n.
Le tableau de pascal est un tableau de n lignes et n colonnes.

Chaque case du tableau est:

    Zéro si i < j 
    Un si i==0 ou i == j

et la somme des deux cases situées au dessus d'elle et au dessus et à gauche.

    tab[1][0] = 1  
    tab[1][1] = 1  
    tab[i][j] = tab[i-1][j-1] + tab[i-1][j] si i > 0 et j > 0 et i > j.


Par exemple, le tableau de pascal de taille 5 est (les zéros ne sont pas affichés) :

    1 1
    1 2 1
    1 3 3 1
    1 4 6 4 1

Attention a ne pas écrire d'espace après le dernier élément de chaque ligne.

Ne pas afficher la première ligne pour i=0. 

Vous pouvez utilisez la fonction qui existe :  void affiche_tableau(int *t, int taille) pour afficher les lignes .


BON Normalement c'est le triangle de Pascal. Nous on fait un tableau ! très triangulaire ;)


PL:== */

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
#ifndef TAILLE
#define TAILLE 100
#endif

void affiche_tableau(int *tab, int n)
{
    int i;
    for (i = 0; i < n - 1; i++)
    {
        printf("%d ", tab[i]);
    }
    printf("%d\n", tab[n - 1]);
}

// PL:==
// PL:solution==

void printTab(int *tab, int n)
{
    int i;
    for (i = 0; i < n - 1; i++)
    {
        printf("%d ", tab[i]);
    }
    printf("%d\n", tab[n - 1]);
}

void pascal(int n)
{
    int i = 0;
    int l = 2;
    int tab[n + 1];
    tab[0] = 1;
    tab[1] = 1;
    printTab(tab, l);
    for (l = 3; l <= n; l++)
    {

        tab[l - 1] = 1;
        for (i = l - 2; i > 0; i--)
        {
            tab[i] = tab[i] + tab[i - 1];
        }
        printTab(tab, l);
    }
}

// PL:==

/* PL:code==
int ajoutTrie(int *tab,int nbe, int valeur) {}

PL:== */

// PL:code_after==

int main(int c, char **v)
{
    pascal(atoi(v[1]));
    return 0;
}
// PL:==

/* PL:checks_args_stdin==
[["Test 5", ["5"], ""],
["Test 11", ["11"], ""],
["Test grand", ["30"], ""],

]
PL:== */

