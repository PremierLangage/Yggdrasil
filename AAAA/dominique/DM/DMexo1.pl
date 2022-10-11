
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

title= DM - Print terrain 
tag=DM

text==#|markdown|
Écrire une function **print_terrain** qui prend 
- un entier representant la hauteur du terrain 
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers) 
- la largeur et affiche le terrain en utilisant les caractères suivants :

    char square='S'
    char flag='F';
    char mine='M';
    char blank=' ';
    char boom='B';

L'encodage est le suivant:
Si la case ne contient rien et qui n’est pas découverte c’est indiqué par un square: 0
Si la case contient une mine c’est indiqué par un 1 étoile. 
Si la case contient un drapeau c’est indiqué avec un 2 drapeau.
Donc 3 indique à la fois une mine et un drapeau. 
si la case est découverte c’est indiqué par un 4 (Action Pied)
Dans cet exemple, il y a 4 mines, 2 drapeaux et une case découverte.
Un 5 indique que le jeux est terminé ... et donc il faut afficher toutes les mines avec boom.
==

editor.code==#|c|
char square='S';
char flag='F';
char mine='M';
char blank=' ';

char boom='B';

void print_terrain(int h, int *t[],int l){
    int c;
    int bb=0;
    for(int i=0;i < h && !bb; i++) for(int j=0;j < l  && !bb; j++) if (t[i][j]==5) bb=1;
    for(int i=0;i < h; i++){
    for(int j=0;j < l ; j++) {
        if (bb && (t[i][j] & 1)) c=boom;
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

==


solution==#|c|
char square='S';
char flag='F';
char mine='M';
char blank=' ';
char boom='B';

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
// Idée du test
// lire un fichier et faire afficher le fichier
// l'etudiant doit ecrire la fonction print_t
int main(int argc, char* argv[]){
    int H=10,L=10,M=10,**t;
    // printf("%s\n",argv[1]);
    t= random_t(H,L,M);

    print_t(H,t,L);
  
  return 0;
}

==


@ game.ga
@ gaga.ga


checks_args_stdin==#|python|
[["Test basique", ["game.ga"], ""],
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
