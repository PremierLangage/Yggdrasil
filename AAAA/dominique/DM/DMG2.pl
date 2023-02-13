extends= DMG1.pl



title= DM - struct - Possede une mine 
tag=DM

text==#|markdown|
Écrire une function **hasmine_g** qui prend

  - Une structure Game 
  - deux entiers correspondant aux coordonnées d'une case  

et qui renvoie

  - 1 si les coordonées correspondent à une case avec une mine
  - 0 si c'est une case sans mines ou si les coordonnées sont en dehors du terrain.


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
