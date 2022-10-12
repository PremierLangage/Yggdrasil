

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

title= DM - Drapeau 
tag=DM

text==#|markdown|
Écrire une function **Drapeau** qui prend 
- deux entiers représenant les dimensions de la grille
- deux entiers représenant les coordonées du choix
- la grille

et ajoute un drapeau aux coordonées choisit si la case est non découverte, enlève le drapeau si il y a un drapeau, et rien sinon.


==

editor.code==#|c|


void Drapeau(int H, int L, int i, int j, int** t){
    switch(t[i][j]){
        case -9 : t[i][j] = 9; break;
        case -10 : t[i][j] = 0; break;
        case 0 : t[i][j] = -10; break;
        case 9 : t[i][j] = -9; break;
        default : break;
    }
}

==


solution==#|c|



void Drapeau(int H, int L, int i, int j, int** t){
    switch(t[i][j]){
        case -9 : t[i][j] = 9; break;
        case -10 : t[i][j] = 0; break;
        case 0 : t[i][j] = -10; break;
        case 9 : t[i][j] = -9; break;
        default : break;
    }
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


==

code_after==#|c|

int main(int argc, char* argv[]){
    int H, L, M, **t;
    printf("%s\n",argv[1]);
    FILE* f = fopen(argv[1],"r");
    t = read_t(argv[1],&H,&L,&M);

    Drapeau(H,L,1,2,t);
  
  return 0;
}

==


@ jeudedepart.ga
@ gaga.ga


checks_args_stdin==#|python|
[["Test basique", ["jeudedepart.ga"], ""],
["Test encore ", ["gaga.ga"], ""]
]
==

astuces==#|python|
[
  { "content": """Votre fonction pourrait retourner `void` sans problème mais doit prendre en argument un pointeur vers un entier (`int*`)."""},
  { "content": """Pour utiliser la valeur d'un pointeur `int* p`, il faut affecter ou utiliser `*p`."""},
  { "content": """L'instruction `*p = *p * 20;` met à jour la valeur pointée en la remplacant par 20 fois l'ancienne valeur."""}
]
==
