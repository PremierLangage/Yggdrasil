extends= DMG2.pl



title= DM - struct - Possede une mine 
tag=DM

text==#|markdown|
Écrire une function **hasmine_g** qui prend

  - Une structure Game 
  - deux entiers correspondant aux coordonnées d'une case  

et qui renvoie

  - 1 si les coordonées correspondent à une case avec une mine
  - 0 si c'est une case sans mines ou si les coordonnées sont en dehors du terrain.

rappel: on réalise un https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o)
==
editor.code==#|c|
int hasmine_g(Game *g, int i, int j){
...
}
==

solution==#|c|
// impression de la matrice de jeu dans un fichier

int hasmine_t(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    return t[i][j] == 9 || t[i][j] == -9;
}


int hasmine_g(Game *g, int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    return hasmine_t(g->H, g->L, g->t, i,j);
}



==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

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
void print_t(int *t[], int h, int l)
{
    fprint_t(stdout, h, t, l);
}
==

code_after==#|c|

int main(int argc, char* argv[]){
    int H,L,M,**t, i, j;
    FILE *f= fopen(argv[1],"r") ;
    Game *g= readGame(f);

    printf("%d",hasmine_g(g,i,j));

  
  return 0;
}

==


@ jeudedepart.ga [game.ga]
@ ex_flag.ga


checks_args_stdin==#|python|
[
["Test basique 1", ["game.ga"], "3 4"],
["Test basique 2", ["game.ga"], "1 1"],
["Test basique 3", ["game.ga"], "0 3"],
["Test basique 4", ["game.ga"], "9 7"],
["Test basique 5", ["game.ga"], "0 0"],
["Test basique 6", ["game.ga"], "15 -12"],
["Test supplémentaire 1", ["ex_flag.ga"], "3 4"],
["Test supplémentaire 2", ["ex_flag.ga"], "1 1"],
["Test supplémentaire 3", ["ex_flag.ga"], "0 3"],
["Test supplémentaire 4", ["ex_flag.ga"], "9 7"],
["Test supplémentaire 5", ["ex_flag.ga"], "0 0"],
["Test supplémentaire 6", ["ex_flag.ga"], "15 -12"],
]
==
