extends = ../eval_mult_c.pl

title = DM Démineur

headers.nb_mines_t==#|c|
int nb_mines_t(int h, int l, int *t[], int i, int j);
== 
sources.nb_mines_t == #|c|
#include "has_mine_t.h"
int nb_mines_t(int h, int l, int *t[], int i, int j) {
    return has_mine_t(h, l, t, i - 1, j - 1) + has_mine_t(h, l, t, i - 1, j) +
           has_mine_t(h, l, t, i - 1, j + 1) + has_mine_t(h, l, t, i, j - 1) +
           has_mine_t(h, l, t, i, j + 1) + has_mine_t(h, l, t, i + 1, j - 1) +
           has_mine_t(h, l, t, i + 1, j) + has_mine_t(h, l, t, i + 1, j + 1);
}
==

headers.fprint_t==#|c|
#include <stdio.h>
void fprint_t(FILE*, int h, int *t[], int l);
==
sources.fprint_t==#|c|
#include <stdio.h>
// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
{
    for (int i = 0; i < h; i++) {
        for (int j = 0; j < l; j++) {
            fprintf(f, "%d ", t[i][j]);
        }
        fprintf(f, "\n");
    }
}
==

headers.print_t==#|c|
void print_t(int h, int *t[], int l);
==
sources.print_t==#|c|
#include "fprint_t.h"

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}
==

headers.save_t==#|c|
// sauvegarde dans un fichier
void save_t(FILE *f, int **t, int H, int L, int M);
==
sources.save_t==#|c|
#include <stdio.h>
#include "fprint_t.h"

// sauvegarde dans un fichier
void save_t(FILE *f, int **t, int H, int L, int M)
{
    fprintf(f, "%d %d %d\n", H, L, M);
    fprint_t(f, H, t, L);
}
==

headers.alloc_t==#|c|
int **alloc_t(int H, int L);
==
sources.alloc_t==#|c|
#include <stdlib.h>

int **alloc_t(int H, int L)
{ // calloc inits memory with zeros
    int **t = calloc(1, H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        t[i] = calloc(1, L * sizeof(int));
    }
    return t;
}

==
headers.random_t==#|c|
int **random_t(int H, int L, int M);
==
sources.random_t==#|c|
#include <stdlib.h>
#include "alloc_t.h"
// alloc and create a new terrain
int **random_t(int H, int L, int M)
{
    // alloc
    int **t = alloc_t(H, L);
    // random mines (M)
    for (int i = 0; i < M; i++)
    {
        int h, l;
        do
        {
            h = rand() % H;
            l = rand() % L;
        } while (t[h][l] == 9);
        t[h][l] = 9;
    }
    return t;
}
==

headers.read_t==#|c|
#include <stdio.h>
int **read_t(FILE *f, int *H, int *L, int *M);
==
sources.read_t==#|c|
#include <stdio.h>
#include <stdlib.h>

int **read_t(FILE *f, int *H, int *L, int *M)
{
    int **t;
    fscanf(f, "%d %d %d", H, L, M);
    t = malloc(*H * sizeof(int *));
    for (int i = 0; i < *H; i++)
    {
        t[i] = malloc(*L * sizeof(int));
    }

    for (int i = 0; i < *H; i++)
    {
        for (int j = 0; j < *L; j++)
        {
            fscanf(f, "%d", &(t[i][j]));
        }
    }
    return t;
}
==

headers.has_mine_t==#|c|
int has_mine_t(int h, int l, int *t[], int i, int j);
==
sources.has_mine_t==#|c|
int has_mine_t(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    // mine ou mine sous drapeau
    return t[i][j] == 9 || t[i][j] == -9;
}
==

headers.pied_t==#|c|
int pied_t(int **t, int H, int L, int i, int j);
==
sources.pied_t==#|c|
#include "nb_mines_t.h"
int pied_t(int **t, int H, int L, int i, int j)
{
    // case découverte pas d'action
    if ((t[i][j] > 0 && t[i][j] < 9) || t[i][j] == -11)
        return 0;
    // case avec une mine
    if (t[i][j] == 9)
    {
        // boom !!
        return 1;
    }
    // case avec drapeau
    if (t[i][j] < -8) // -9 ou -10
        return 0;
    // case pas découverte et pas de drapeau
    t[i][j] = nb_mines_t(H, L, t, i, j);
    if (t[i][j] == 0)
        t[i][j] = -11;
    return 0;
}

==
headers.drapeau_t==#|c|
void drapeau_t(int **t, int H, int L, int i, int j);
==
sources.drapeau_t==#|c|
void drapeau_t(int **t, int H, int L, int i, int j)
{ // click droit sur la case i,j
    // placement d'un drapeau
    if (t[i][j] == 9)
    {
        t[i][j] = -9;
        return;
    }
    if (t[i][j] == -9)
    {
        t[i][j] = 9;
        return;
    }
    // toggle un drapeau
    if (t[i][j] == 0)
    {
        t[i][j] = -10;
        return;
    }
    if (t[i][j] == -10)
    {
        t[i][j] = 0;
        return;
    }
    // sinon pas d'effet sur le terrain
}
==

headers.print_end_t==#|c|
void print_end_t(int H, int L, int **t);
==
sources.print_end_t==#|c|
#include <stdio.h>

#include "nb_mines_t.h"

void print_end_t(int H, int L, int **t)
{
    for (int i = 0; i < H; i++)
    {
        for (int j = 0; j < L; j++)
        {
            if (t[i][j] == 9)
                printf("%c", 'X');
            else if (t[i][j] == -9)
                printf("%c", 'O');
            else
                printf("%c", nb_mines_t(H, L, t, i, j) + '0');
        }
        printf("\n");
    }
}

==
headers.nb_drapeau_t==#|c|
int nb_drapeau_t(int H, int L, int **t);
==
sources.nb_drapeau_t==#|c|
int nb_drapeau_t(int H, int L, int **t)
{
    int i, j, n = 0;
    for (i = 0; i < H; i++)
        for (j = 0; j < L; j++)
            if (t[i][j] == -9 || t[i][j] == -10)
                n++;
    return n;
}
==

headers.verif_t==#|c|
int verif_t(int H, int L, int M, int **t);
==
sources.verif_t==#|c|
#include "nb_drapeau_t.h"
int verif_t(int H, int L, int M, int **t)
{
    int i, j;
    if (nb_drapeau_t(H, L, t) != M)
        return 0;

    for (i = 0; i < H; i++)
        for (j = 0; j < L; j++)
            if (t[i][j] == 9)
                return 1;
    return 0;
}
==

# Game version

headers.struct==#|c|
#ifndef __STRUCT__
#define __STRUCT__
struct _game
{
    int termine;
    int H;
    int L;
    int M;
    int **t;
};

typedef struct _game Game;
#endif
==

headers.malloc_game==#|c|
void *malloc_game(int H, int L, int M);
==
sources.malloc_game==#|c|
#include <stdlib.h>
#include "struct.h"
// allocation de la structure game
// et d'une matrice de taille H*L et initialisation à 0
void *malloc_game(int H, int L, int M)
{
    Game *g = malloc(sizeof(Game));
    g->termine = 0;
    g->H = H;
    g->L = L;
    g->M = M;
    g->t = calloc(1, H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        g->t[i] = calloc(1, L * sizeof(int));
    }
    return g;
}
==

headers.free_game==#|c|
#include "struct.h"
void free_game(Game *g);
==
sources.free_game==#|c|
#include <stdlib.h>
#include "struct.h"
// libération de la mémoire
void free_game(Game *g)
{
    for (int i = 0; i < g->H; i++)
    {
        free(g->t[i]);
    }
    free(g->t);
    free(g);
}
==

headers.read_game==#|c|
#include <stdio.h>
#include "struct.h"

Game *read_game(FILE *f);
==
sources.read_game==#|c|
#include <stdio.h>
#include "struct.h"
#include "malloc_game.h"
//  allocation de la structure et lecture du fichier
Game *read_game(FILE *f)
{
    int H, L, M;
    fscanf(f, "%d %d %d", &H, &L, &M);
    Game *g = malloc_game(H, L, M);
    int **t = g->t;
    for (int i = 0; i < H; i++)
    {
        for (int j = 0; j < L; j++)
        {
            fscanf(f, "%d", &(t[i][j]));
        }
    }
    return g;
}
==

headers.nb_mines_game==#|c|
#include "struct.h"
int nb_mines_game(Game *g, int i, int j);
==
sources.nb_mines_game==#|c|
#include "struct.h"
#include "nb_mines_t.h"
int nb_mines_game(Game *g, int i, int j)
{
    return nb_mines_t(g->H, g->L, g->t, i, j);
}
==

headers.save_game==#|c|
#include <stdio.h>
#include "struct.h"
void save_game(FILE *f, Game *g);
==
sources.save_game==#|c|
#include <stdio.h>
#include "struct.h"
#include "fprint_t.h"
void save_game(FILE *f, Game *g)
{
    fprintf(f, "%d %d %d\n", g->H, g->L, g->M);
    fprint_t(f, g->H, g->t, g->L);
}
==

headers.print_game==#|c|
#include "struct.h"
void print_game(Game *g);
==
sources.print_game==#|c|
#include "struct.h"
#include "save_game.h"
void print_game(Game *g)
{
    save_game(stdout, g);
}
==

headers.has_mine_game==#|c|
#include "struct.h"
int has_mine_game(Game *g, int i, int j);
==
sources.has_mine_game==#|c|
#include "struct.h"
#include "has_mine_t.h"
int has_mine_game(Game *g, int i, int j)
{
    return has_mine_t(g->H, g->L, g->t, i, j);
}
==

headers.random_game==#|c|
#include "struct.h"
Game *random_game(int H, int L, int M);
==
sources.random_game==#|c|
#include "struct.h"
#include "malloc_game.h"
#include "random_t.h"
Game *random_game(int H, int L, int M)
{
    Game *g = malloc_game(H, L, M);
    g->t = random_t(H, L, M);
    return g;
}
==

headers.restart_game==#|c|
#include "struct.h"
void restart_game(Game *g)
==
sources.restart_game==#|c|
#include <stdlib.h>

#include "struct.h"
void restart_game(Game *g)
{
    int i, j;
    for (i = 0; i < g->H; i++)
        for (j = 0; j < g->L; j++)
            g->t[i][j] = 0;
    for (i = 0; i < g->M; i++)
    {
        int h, l;
        do
        {
            h = rand() % g->H;
            l = rand() % g->L;
        } while (g->t[h][l] == 9);
        g->t[h][l] = 9;
    }
}
==

headers.pied_game==#|c|
#include "struct.h"
int pied_game(Game *g, int i, int j);
==
sources.pied_game==#|c|
#include "struct.h"
#include "pied_t.h"

int pied_game(Game *g, int i, int j)
{ // click gauche sur la case i,j
    return pied_t(g->t, g->H, g->L, i, j);
}
==

headers.print_end_game==#|c|
#include "struct.h"
void print_end_game(Game *g);
==
sources.print_end_game==#|c|
#include <stdio.h>

#include "struct.h"
#include "nb_mines_t.h"
// affiche le terrain après explosion
void print_end_game(Game *g)
{
    for (int i = 0; i < g->H; i++)
    {
        for (int j = 0; j < g->L; j++)
        {
            if (g->t[i][j] == 9)
                printf("%c", 'X');
            else if (g->t[i][j] == -9)
                printf("%c", 'O');
            else
                printf("%c", nb_mines_game(g, i, j) + '0');
        }
        printf("\n");
    }
}
==

headers.verif_game==#|c|
#include "struct.h"
int verif_game(Game *g);
==
sources.verif_game==#|c|
#include "struct.h"
#include "nb_drapeau_t.h"

int verif_game(Game *g)
{
    int i, j;
    if (nb_drapeau_t(g->H, g->L, g->t) != g->M)
        return 0;
    for (i = 0; i < g->H; i++)
        for (j = 0; j < g->L; j++)
            if (g->t[i][j] == 9)
                return 1; // boom mine sans drapeau
    return 0;
}
==

sources.main==#|c|
int main() {
    return 0;
}
==