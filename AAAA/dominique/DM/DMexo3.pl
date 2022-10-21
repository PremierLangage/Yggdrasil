
extends=DMexo1.pl




title = DM - Victoire


tag=DM

text==#|markdown|
Écrire une function **victoire_t** qui prend  

- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier representant la hauteur du terrain  
- un entier la largeur  
- un entier le nombre de mines  
et qui retourne si oui ou non c'est une victoire.

La condition de victoire est:  
- soit il y a autant de drapeaux que de mines et que les drapeaux sont bien placés.  
- soit toutes les cases sans mines sont découvertes (et les mines ne sont pas découverte).  

Attention le test est un peu long.
==

editorXcode==#|C|

int victoire_t(int **t, int H, int L, int M){
int nb=0;
int bad=0;
int nm=0;
for(int i=0; i < H; i++)
    for(int j=0; j< L; j++)
    {
        if (t[i][j]==-9) nb++;
        if (t[i][j]==-10) bad++;
        if (t[i][j]==0) nm++;
    }

if (((nb == M)||(nm==0)) && bad ==0) return 1;
return 0;
}

==

solution==


int victoire_t(int **t, int H, int L, int M){
int nb=0;
int bad=0;
int nm=0;
for(int i=0; i < H; i++)
    for(int j=0; j< L; j++)
    {
        if (t[i][j]==-9) nb++;
        if (t[i][j]==-10) bad++;
        if (t[i][j]==0) nm++;
    }

if (((nb == M)||(nm==0)) && bad ==0) return 1;
return 0;
}

==



code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

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

void print_g(Game *g)
{
    saveGame(stdout, g);
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
int **random_t(int H, int L, int M, int seed)
{
    // alloc
    if (seed) srand(time(NULL));

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

code_after==#|c|
// Idée du test
// lire un fichier et faire afficher le fichier
// l'etudiant doit ecrire la fonction print_t
int main(int argc, char* argv[]){
    FILE *f;
    Game *g;
    while (*++argv){
        f= fopen(*argv,"r") ;
        g= readGame(f);
        printf("\n");
        print_g(g);
        printf("Victoire %s : %d\n",*argv, victoire_t(g->t,g->H,g->L,g->M));
        fclose(f);
    }

  return 0;
}

==

@ victoire1.ga [test1]
@ victoire2.ga [test2]
@ nbmines.ga [test3]
@ jeudedepart.ga [test4]

checks_args_stdin==#|python|
[["Test un", ["test1","test2","test3","test4"], ""]]
==

astuces=[]

