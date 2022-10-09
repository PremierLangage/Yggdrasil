
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

title= Print terrain 
tag=fonction|pointeur|variable

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

int readFile(char *filename, int *H, int *L, int *M, int ***r)
{
    FILE *fp;
    char c;
    int **t;
    fp = fopen(filename, "r");
    if (fp == NULL)
    {
        printf("Error opening file %s", filename);
        exit(1);
    }
    if (3 != fscanf(fp, "%d %d %d", H, L, M))
    {
        printf("Error reading file %s", filename);
        exit(1);
    }
    fscanf(fp, "%c", &c); // linefeed
    t = (int **)malloc(*L * *H * sizeof(int *));
    for (int i = 0; i < *H; i++)
    {
        t[i] = (int *)malloc(*L * sizeof(int));
        for (int j = 0; j < *L; j++)
        {
            // printf("(/%d/%d/)", i, j);
            if (1 != fscanf(fp, "%c", &c))
            {
                fprintf(stderr, "Error reading file %s pos %d %d", filename, i, j);
                exit(1);
            }
            // printf("%d:%c ", j, c);
            t[i][j] = (int)(c - '0');
        }
        c = 0;
        fscanf(fp, "%c", &c); // line feed
        // printf("%c", c);
        if (c != '\n')
        {
            if (c == 0)
            {
                fprintf(stderr, "Missing linefeed at end of file");
            }
            else
            {
                fprintf(stderr, "Error reading line feed char=%d \n", (int)c);
                exit(1);
            }
        }
    }
    *r = t;
   return 1; // ok
}
==

code_after==#|c|

int main(int argc, char* argv[]){
    int H,L,M,**t;
    printf("%s\n",argv[1]);
    readFile(argv[1],&H,&L,&M,&t);

    print_terrain(H,t,L);
  
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
