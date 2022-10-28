
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


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Henri Derycke

title= DM - Print terrain 
tag=DM

text==#|markdown|
Écrire une function **print_t** qui prend  

- un entier representant la hauteur du terrain  
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier la largeur  

et qui  
affiche le terrain sous forme d'entiers par exemple 

    0 0 9 9 0 9 0 0 0 0 
    0 2 0 3 0 0 0 0 0 0 
    0 1 9 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 9 9 
    0 0 0 0 0 0 0 0 9 0 
    0 0 0 0 0 0 0 0 0 0 

rappel: on réalise un https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o)
==

form ==
==

editor =: CodeEditor
editor.theme=dark
editor.language=c

editor.code==#|c|
void print_t(int ..., int *...[], int ...){
...
}
==
editorXcode==#|c|
// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
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

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}
==


solution==#|c|
// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
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

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}

==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
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
    int H=10,L=10,M=10,**t;
    int seed= ! strcmp(argv[1],"alea");
    t= random_t(H,L,M,seed);
    print_t(H,t,L);


  return 0;
}

==



checks_args_stdin==#|python|
[["Test basique", ["not alea"], ""],
["Test encore ", ["alea"], ""]
]
==

astuces==#|python|
[
  { "content": """
  Lire l'introduction du pltp."""},
  { "content": """Les entiers  stockés dans le terrain indiquent:  
0 Case non découverte sans mine  
9 case non découverte avec une mine  
1 à 8 case découverte sans mine, l'entier indique le nombre de mines des cases avoisinantes, -11 si zéro mines.  
-9 une mine avec un drapeau placé dessus  
-10 une case sans mine avec un drapeau placé dessus.
"""},
  { "content": """Il y a des espaces en fin de ligne dans le format de fichier."""}
]
==




evaluator==#|python|
grade = (90, 'Pouet')
==
