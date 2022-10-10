

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

editor.code==#|c|



==


solution==#|c|


int nbmines(int H, int **t, int L, int i, int j){
    int nb=0;
    for(int i=-1; i <H ; i++)
        for(int j=-1; j < L; j++)
        {
            if ( i==j && i==0) continue;
            if (t[i][j]==9 || t[i][j]== -9)
                nb++;
    }
    return nb;
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
    //printf("%s\n",argv[1]);
    readFile(argv[1],&H,&L,&M,&t);
    // int nbmines(int H, int **t, int L, int i, int j){
    printf("%d %d %d\n", nbmines(H,t,L, 3,4), nbmines(H,t,L, 2,2), nbmines(H,t,L, 0,0));
    printf("%d %d %d\n", nbmines(H,t,L, H,L), nbmines(H,t,L, H,0), nbmines(H,t,L, 0,L));
    
  
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
