

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

author=Dominique Revuz

title= DM - nbmines


tag=DM

text==#|markdown|
Écrire une function **nbmines** qui prend  

- un entier representant la hauteur du terrain  
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier la largeur  
- un entier i  
- un entier j  

Cherche dans le tableau le nombre de mines autour de la case i,j.

Les cases contenant une mine contiennent soit 9 soit -9.

==

Xeditor.code==#|c|



==
editor.code =@  solution.c

solution=@ solution.c
code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int** read_t(FILE* f, int* H, int* L, int* M)
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
            fscanf(f, "%d", t[i][j]);
        }
    }
    return t;
}


int **randomTerrain(int H, int L, int M){
    int **t;
    
    t=malloc(H * sizeof(int *));
        for (int i = 0; i < H; i++)
        {
            t[i] = malloc(L * sizeof(int));
        }
    
    for (i = 0; i < H; i++)
        for (j = 0; j < L; j++)
            t[i][j] = 0;
    for (i = 0; i < M; i++)
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
    int H,L,M,**t;
    //printf("%s\n",argv[1]);
    if (strcmp(argv[1],"alea"){
         H=10; L=10; M=10;
        t = randomterrain(H,L,M);
    }
    else { 
        FILE f= open(argv[1],"r");
        t = read_t(f, &H, &L, &M);
    }
    // int nbmines(int H, int **t, int L, int i, int j){
    printf("%d %d %d\n", nbmines(H,t,L, 3,4), nbmines(H,t,L, 2,2), nbmines(H,t,L, 0,0));
    printf("%d %d %d\n", nbmines(H,t,L, H,L), nbmines(H,t,L, H,0), nbmines(H,t,L, 0,L));
  return 0;
}

==


@ game.ga 
@ gaga.ga


checks_args_stdin==#|python|
[["Test basique", ["alea"], ""],
["Test encore ", ["gaga.ga"], ""]
]
==
