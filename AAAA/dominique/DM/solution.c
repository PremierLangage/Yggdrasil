

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

// allocation de la structure game
// et d'une matrice de taille H*L et initialisation à 0
void *mallocGame(int H, int L, int M)
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
// libération de la mémoire
void freeGame(Game *g)
{
    for (int i = 0; i < g->H; i++)
    {
        free(g->t[i]);
    }
    free(g->t);
    free(g);
}

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

//  allocation de la structure et lecture du fichier
Game *readGame(FILE *f)
{
    int H, L, M;
    fscanf(f, "%d %d %d", &H, &L, &M);
    Game *g = mallocGame(H, L, M);
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

int hasmine_t(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    // mine ou mine sous drapeau
    return t[i][j] == 9 || t[i][j] == -9;
}
int hasmine_g(Game *g, int i, int j)
{
    return hasmine_t(g->H, g->L, g->t, i, j);
}

int nbmines_t(int h, int l, int *t[], int i, int j)
{
    return hasmine_t(h, l, t, i - 1, j - 1) + hasmine_t(h, l, t, i - 1, j) + hasmine_t(h, l, t, i - 1, j + 1) + hasmine_t(h, l, t, i, j - 1) + hasmine_t(h, l, t, i, j + 1) + hasmine_t(h, l, t, i + 1, j - 1) + hasmine_t(h, l, t, i + 1, j) + hasmine_t(h, l, t, i + 1, j + 1);
}

int nbmines_g(Game *g, int i, int j)
{
    return nbmines_t(g->H, g->L, g->t, i, j);
}

// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
{
    for (int i = 0; i < h; i++)
    {
        for (int j = 0; j < l; j++)
        {
            fprintf(f, "%d ", t[i][j]);
        }
        fprintf(f, "\n");
    }
}

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}


void saveGame(FILE *f, Game *g)
{
    fprintf(f, "%d %d %d\n", g->H, g->L, g->M);
    fprint_t(f, g->H, g->t, g->L);
}

void printGame(Game *g)
{
    saveGame(stdout, g);
}

// sauvegarde dans un fichier
void save_t(FILE *f, int **t, int H, int L, int M)
{
    fprintf(f, "%d %d %d\n", H, L, M);
    fprint_t(f, H, t, L);
}

int **alloc_t(int H, int L)
{ // calloc inits memory with zeros
    int **t = calloc(1, H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        t[i] = calloc(1, L * sizeof(int));
    }
    return t;
}

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

Game *randomGame(int H, int L, int M)
{
    Game *g = mallocGame(H, L, M);
    g->t = random_t(H, L, M);
    return g;
}

void restartGame(Game *g)
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
    if (t[i][j] > 0 && t[i][j] < 9 || t[i][j] == -11)
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
    t[i][j] = nbmines_t(H, L, t, i, j);
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

int PG(Game *g, int i, int j)
{ // click gauche sur la case i,j
    return P(g->t, g->H, g->L, i, j);
}

// return if the game is over (1) or not (0)
int playGame(Game *p)
{
    int i, j;
    int formats = 0;
    do
    {
        printf("i j ? ");
        scanf("%d %d", &i, &j);
        if (formats != 2)
        {
            printf("Erreur de d'entree, veuillez reessayer");
        }
    } while (formats != 2);

    return PG(p, i, j);
}

// affiche le terrain après explosion
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
                printf("%c", nbmines_g(g, i, j) + '0');
        }
        printf("\n");
    }
}
void printEnd_t(int H, int L, int **t)
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
                printf("%c", nbmines_t(H, L, t, i, j) + '0');
        }
        printf("\n");
    }
}

int nbdrapeau(int H, int L, int **t)
{
    int i, j, n = 0;
    for (i = 0; i < H; i++)
        for (j = 0; j < L; j++)
            if (t[i][j] == -9 || t[i][j] == -10)
                n++;
    return n;
}
int verif_t(int H, int L, int M, int **t)
{
    int i, j;
    if (nbdrapeau(H, L, t) != M)
        return 0;

    for (i = 0; i < H; i++)
        for (j = 0; j < L; j++)
            if (t[i][j] == 9)
                return 1;
    return 0;
}

int verifGame(Game *g)
{
    int i, j;
    if (nbdrapeau(g->H, g->L, g->t) != g->M)
        return 0;
    for (i = 0; i < g->H; i++)
        for (j = 0; j < g->L; j++)
            if (g->t[i][j] == 9)
                return 1; // boom mine sans drapeau
    return 0;
}

// return if the game is over (1) or not (0)
int play_t(int H, int L, int **t)
{
    int i, j;
    int formats = 0;
    do
    {
        printf("i j ? ");
        formats = scanf("%d %d", &i, &j);
        if (formats != 2)
        {
            printf("Erreur de d'entree, veuillez reessayer");
        }
    } while (formats != 2);

    return P(t, H, L, i, j);
}

void v_t()
{
    int H = 10, L = 10, M = 20;
    int **t;
    t = random_t(H, L, M);
    print_t(H, t, L);
    while (!verif_t(H, L, M, t))
    {
        if (play_t(H, L, t))
        {
            printEnd_t(H, L, t);
            printf("BOOM !!\n");
        }
        else
            print_t(H, t, L);
    }
}

void vgame()
{
    int terminer = 0; // pas fini
    int victoire = 0; // pas encore gagné
    Game *g = randomGame(10, 10, 10);
    printGame(g);

    while (!terminer)
    {
        terminer = playGame(g);
        // option
        // si le nombre de drapeau est égal au nombre de mines
        // verifier que les drapeaux sont bien placés
        // si c'est le cas, gagner la partie !
        if (verifGame(g))
        {
            terminer = 1;
            victoire = 1;
        }
        printGame(g);
    }
    printEndGame(g);
}

int main()
{
    // vgame();
    v_t();
    return 0;
}