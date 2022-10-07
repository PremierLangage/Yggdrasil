
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

title=Mettre au cube une valeur pointée
tag=fonction|pointeur|variable

text==#|markdown|
Écrire une function **print_terrain** qui prend l'adresse d'un vecteur d'entier (pointeur vers 
un tableau de  pointeur sur des tablaux d'entiers) la hauteur du terrain et la largeur et affiche le terrain en utilisant les caractères suivants mine,square,flag,blank:
*, ⚑, ❑ et l’espace.

==

editor.code==#|c|
void print_terrain(int h, int *t[],int l){
  // Votre code ici...

;

}
==


solution==#|c|
char square='❑'
char flag='⚑';
char mine='☀';
char blank=' ';

void print_terrain(int h, int *t[],int l){
    int c;
    for(int i=0;i < h; i++){
    for(int j=0;j < l ; j++) {
        switch(t[i][j]){
            case 0: c = square; break;
            case 2: case 3: c=flag; break;
            case 4: c= blank; break;
        }
        print("%c",c);
        }
    printf("\n");
    }
}

==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
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
    readFile("game.ga",&H,&L,&M,&t);

    print_terrain(t,H,L);
  
  return 0;
}

==

checks_args_stdin==#|python|
[["Test basique", ["1"], ""],
 ["Simple nombre négatif", ["-3"], ""],
 ["Test aléatoire 1", [str(randint(1, 33))], ""],
 ["Test aléatoire 2", [str(randint(-50, -12))], ""],
 ["Test aléatoire 3", [str(randint(-100, 100))], ""],
 ["Test aléatoire 4", [str(randint(-100, 100))], ""]]
==

astuces==#|python|
[
  { "content": """Votre fonction pourrait retourner `void` sans problème mais doit prendre en argument un pointeur vers un entier (`int*`)."""},
  { "content": """Pour utiliser la valeur d'un pointeur `int* p`, il faut affecter ou utiliser `*p`."""},
  { "content": """L'instruction `*p = *p * 20;` met à jour la valeur pointée en la remplacant par 20 fois l'ancienne valeur."""}
]
==
