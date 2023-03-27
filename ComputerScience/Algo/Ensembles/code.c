

// PL:codebefore ==
#include <stdio.h>
#include <stdlib.h>
#define BLOC 5

typedef struct
{
    int taille;
    int *arbre;
    int max;
} ENSEMBLE;

int nbrealloc = 0;
int nbmalloc = 0;
void *dobob(void *p, int size)
{
    if (p == NULL)
    {
        nbmalloc++;
        printf("malloc(%d)", size);
        return malloc(size);
    }
    else
    {
        nbrealloc++;
        printf("realloc(%d)", size);
        return realloc(p, size);
    }
}

int printallocs()
{
    printf("nbmalloc = %d, nbrealloc = %d", nbmalloc, nbrealloc);
}

#define realloc(p, size) dobob(p, size)
#define malloc(size) dobob(NULL, size)
// PL:==

// PL:codeafter ==
int main(int argvc, char *argv[])
{
    ENSEMBLE *t = alloueTabDyn();

    if (init(&t) == 0)
        return 1;

    while (1 == scanf("%d", &x))
    {
        ajoute(&t, x);
        affiche(t);
        if (!estTas(t.arbre, t.taille))
        {
            fprintf(stderr, " n'est pas un tas ");
            break;
        }
    }

    return 0;
}
// PL:==
