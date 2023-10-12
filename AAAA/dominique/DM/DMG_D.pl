
extends= DMexoD.pl



author=Julien Roupin & DR

title= DM - struct - Drapeau
tag=DM

text==#|markdown|
Écrire une function **Drapeau_g** qui prend

- une structure Game en paramêtre
- deux entiers représentant les coordonées du choix de la case   


et ajoute un drapeau aux coordonées choisient si la case est non découverte, enlève le drapeau si il y a un drapeau, et ne fait rien si la case est découverte.   

Pour rappel, le code est le suivant :

  - Si une case est pas découverte :
    - 9 si il y a une mine   
    - -9 si il y a une mine et un drapeau  
    - -10 si il y a un drapeau  
    - 0 sinon  
  - Si une case est découverte:  
    - 1 à 8 le nombre de mines autour de la case  
    - -11 pour 0 mines   


==

editor.code==


==


solution==#|c|

void Drapeau_t(int H, int L, int i, int j, int* t[]){
    switch(t[i][j]){
        case -9 : t[i][j] = 9; break;
        case -10 : t[i][j] = 0; break;
        case 0 : t[i][j] = -10; break;
        case 9 : t[i][j] = -9; break;
        default : break;
    }
}

void Drapeau_g(Game *g, int i, int j){
    Drapeau_t(g->H, g-> L, i,j,g->t);

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

==

code_after==#|c|

int main(int argc, char* argv[]){
    int  a, b, c, d;
    printf("%s\n",argv[1]);
    FILE* f = fopen(argv[1],"r");
    Game *g = readGame(f);
    scanf("%d%d%d%d", &a, &b, &c, &d);
    Drapeau_g(g,a,b);
    printGame(g);
    printf("\n");
    Drapeau_g(g,c,d);
    printGame(g);
  
  return 0;
}

==
