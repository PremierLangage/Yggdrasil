
// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
#define BLOC 5

typedef struct
{
    int taille;
    int *tab;
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

// PL:solution==

ENSEMBLE *alloueTabDyn()
{
    ENSEMBLE *s = malloc(sizeof(ENSEMBLE));
    s->tab = malloc(BLOC * sizeof(int));
    return s;
}
int resize(ENSEMBLE *e)
{
    if (e->taille == e->max)
        return (int)s->tab = realloc(s->tab, s->max += BLOC);
    if (e->taille + 2 * BLOC < e->max)
        return (int)s->tab = realloc(s->tab, s->max -= BLOC);
    return 0;
}

// PL:==

// PL:code_after==
int main(int argvc, char *argv[])
{
    ENSEMBLE *t = alloueTabDyn();

    if (init(&t) == 0)
        return 1;

    t->taille = t->max;
    resize(t);
    t->taille = t->max;
    resize(t);
    t->taille = t->max;
    resize(t);
    t->taille = t->max / 2;
    resize(t);

    return 0;
}
// PL:==
