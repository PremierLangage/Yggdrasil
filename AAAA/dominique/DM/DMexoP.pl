


#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC17_clang.pl

author=Julien Roupin

title= DM - Pied 
tag=DM

text==#|markdown|
Écrire une function **Pied** qui prend

- deux entiers représentant les dimensions de la grille   
- deux entiers représentant les coordonées du choix   
- la grille   

et pose le pied aux coordonées choisient si la case est non découverte et sans drapeau (et donc la découvre), et ne fait rien si la case est déjà découverte ou a un drapeau.   

Le fonction retourne un entier selon si avez explosé (1) ou non (0).

Pour rappel, le code est le suivant :

- Si une case est pas découverte :
    - 9 si il y a une mine   
    - -9 si il y a une mine et un drapeau  
    - -10 si il y a un drapeau  
    - 0 sinon  
- Si une case est découverte:  
    - 1 à 8 le nombre de mines autour de la case  
    - -11 pour 0 mine
    - 10 pour une mine explosée   


==

editor.code==#|c|


int Pied_t(int H, int L, int i, int j, int* t[]){
    
}

==


solution==#|c|



int Pied_t(int H, int L, int i, int j, int* t[]){
    switch(t[i][j]){
        case 9 : t[i][j] = 10; return 1;
        case 0 : t[i][j] = nbmines_t(H, L, t, i, j);
        if(t[i][j] == 0) {t[i][j] = -11;}
        default : break;
    }
    return 0;
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


int hasmine_t(int h, int l, int *t[], int i, int j)
{
    if ((i < 0) || (i > h - 1) || (j < 0) || (j > l - 1))
        return 0;

    return t[i][j] == 9 || t[i][j] == -9;
}

int nbmines_t(int h, int l, int *t[], int i, int j)
{
    return hasmine_t(h, l, t, i - 1, j - 1) + hasmine_t(h, l, t, i - 1, j) + hasmine_t(h, l, t, i - 1, j + 1) + hasmine_t(h, l, t, i, j - 1) + hasmine_t(h, l, t, i, j + 1) + hasmine_t(h, l, t, i + 1, j - 1) + hasmine_t(h, l, t, i + 1, j) + hasmine_t(h, l, t, i + 1, j + 1);
}

==

code_after==#|c|

int main(int argc, char* argv[]){
    int H, L, M, **t, a, b;
    printf("%s\n",argv[1]);
    FILE* f = fopen(argv[1],"r");
    t = read_t(f,&H,&L,&M);

    scanf(" %d %d", &a, &b);
    if (Pied_t(H,L,a,b,t)) printf("\nBoom!\n");
    print_t(t, H, L);
    printf("\n");
    scanf(" %d %d", &a, &b);
    if (Pied_t(H,L,a,b,t)) printf("\nBoom!\n");
    print_t(t, H, L);
  
  return 0;
}

==


@ jeudedepart.ga
@ gaga.ga


checks_args_stdin==#|python|
[
["Test basique 1", ["jeudedepart.ga"], "1 2 3 4"],
["Test basique 2", ["jeudedepart.ga"], "1 2 1 2"],
["Test basique 3", ["jeudedepart.ga"], "0 4 2 2"],
["Test basique 4", ["jeudedepart.ga"], "0 1 4 3"],
["Test basique 5", ["jeudedepart.ga"], "0 0 0 0"],
["Test basique 6", ["jeudedepart.ga"], "0 2 0 2"],
["Test supplémentaire 1", ["gaga.ga"], "1 2 3 4"],
["Test supplémentaire 2", ["gaga.ga"], "1 2 1 2"],
["Test supplémentaire 3", ["gaga.ga"], "0 4 2 2"],
["Test supplémentaire 4", ["gaga.ga"], "0 1 4 3"],
["Test supplémentaire 5", ["gaga.ga"], "0 0 0 0"],
["Test supplémentaire 6", ["gaga.ga"], "0 2 0 2"],
["Test supplémentaire 7", ["gaga.ga"], "1 1 1 1"],
]
==


