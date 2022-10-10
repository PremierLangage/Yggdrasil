

#include <stdio.h>
#include <stdlib.h>

struct _game
{
    int termine;
    int H;
    int L;
    int M;
    int **t;
};

typedef struct _game Game;

void *mallocGame(int H, int L, int M)
{
    Game *g = malloc(sizeof(Game));
    g->termine = 0;
    g->H = H;
    g->L = L;
    g->M = M;
    g->t = malloc(H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        g->t[i] = malloc(L * sizeof(int));
    }
    return g;
}
void freeGame(Game *g)
{
    for (int i = 0; i < g->H; i++)
    {
        free(g->t[i]);
    }
    free(g->t);
    free(g);
}

void readGame(FILE *f, Game *g)
{
    fscanf(f, "%d %d %d", &g->H, &g->L, &g->M);
    for (int i = 0; i < g->H; i++)
    {
        for (int j = 0; j < g->L; j++)
        {
            fscanf(f, "%d", &g->t[i][j]);
        }
    }
}

void printGame(Game *g)
{
    printf("%d %d %d\n", g->H, g->L, g->M);
    for (int i = 0; i < g->H; i++)
    {
        for (int j = 0; j < g->L; j++)
        {
            printf("%d ", g->t[i][j]);
        }
        printf("\n");
    }
}

char square = 'S'; //
char flag = 'F';
char mine = 'M';
char blank = ' ';
char boom = 'B';

int hasmine(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    // mine ou mine sous drapeau
    return t[i][j] == 9 || t[i][j] == -9;
}

int nbmines(int h, int l, int *t[], int i, int j)
{

    return hasmine(h, l, t, i - 1, j - 1) + hasmine(h, l, t, i - 1, j) + hasmine(h, l, t, i - 1, j + 1) + hasmine(h, l, t, i, j - 1) + hasmine(h, l, t, i, j + 1) + hasmine(h, l, t, i + 1, j - 1) + hasmine(h, l, t, i + 1, j) + hasmine(h, l, t, i + 1, j + 1);
}

// Version 1
/*
void print_terrain(int h, int *t[],int l){
    int c;
    int bb=0;
    for(int i=0;i < h && !bb; i++) for(int j=0;j < l  && !bb; j++) if (t[i][j]==5) bb=1;
    for(int i=0;i < h; i++){
    for(int j=0;j < l ; j++) {
        if (bb && (t[i][j] & 1)) {
            c=boom;

    }
        else
        switch(t[i][j]){
            case 0: c = square; break;
            case 2: case 3: c=flag; break;
            case 4: c= blank; break;
            case 1: c=mine; break;
        }
        printf("%c",c);
        }
    printf("\n");
    }
}
*/

// version 2

void fprint_terrain(FILE *f, int h, int *t[], int l)
{
    int c;
    int bb = 0;

    for (int i = 0; i < h; i++)
    {
        for (int j = 0; j < l; j++)
        {
            fprintf(f, "%d ", t[i][j]);
        }
        fprintf(f, "\n");
    }
}
void print_terrain(int h, int *t[], int l)
{
    fprint_terrain(stdout, h, t, l);
}

void saveGame(FILE *f, Game *g)
{
    fprintf(f, "%d %d %d\n", g->H, g->L, g->M);
    for (int i = 0; i < g->H; i++)
    {
        for (int j = 0; j < g->L; j++)
            fprintf(f, "%d ", g->t[i][j]);
        fprintf(f, "\n");
    }
}

void save(FILE *f, int **r, int H, int L, int M)
{
    fprintf(f, "%d %d %d\n", H, L, M);
    fprint_terrain(f, H, r, L);
}

void createGame(Game *g, int H, int L, int M)
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

int P(int **t, int H, int L, int i, int j)
{
    // case découverte pas d'action
    if (t[i][j] > 0 && t[i][j] < 9)
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
    t[i][j] = nbmines(H, L, t, i, j);
    if (t[i][j] == 0)
        t[i][j] = -11;
    return 0;
}

void D(int **t, int H, int L, int i, int j)
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
    // retirer un drapeau
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

void PG(Game *g, int i, int j)
{ // click gauche sur la case i,j
    P(g->t, g->H, g->L, i, j);
}

void playGame(Game *p)
{
    int i, j;
    printf("i j ? ");
    scanf("%d %d", &i, &j);
    PG(p, i, j);
}

void printEndGame(Game *g)
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
                printf("%c", nbmines(g->H, g->L, g->t, i, j) + '0');
        }
        printf("\n");
    }
}

// int main(int argc, char *argv[])
// {
//     FILE *f = fopen("go.ga", "r");
//     Game *g = mallocGame(10, 10, 10);
//     // readGame(f, g);
//     createGame(g, 10, 10, 10);
//     while (!g->termine)
//     {
//         // printEndGame(g);
//         printf("\n");
//         playGame(g);
//         saveGame(stdout, g);
//     }
//     saveGame(f, g);
//     freeGame(g);
//     fclose(f);
//     return 0;
// }