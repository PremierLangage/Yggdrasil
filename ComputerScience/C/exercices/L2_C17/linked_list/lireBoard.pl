

#*****************************************************************************
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

title=  Lecture d'un échiquier.

tag=fichier|programme|affichage|lecture

author=DR

editor.height=300px


text==#|markdown|

Format de stockage d'un échiquier.

    Le fichier contient 8 ligne de 8+1 caractères (passage à la ligne).

    Un **V** indique une case vide de l'échiquier. 
    Un **T** indique une TOUR noire, un **t** une TOUR blanche.
    Un **F** indique un FOU noir, un **f** un FOU blanc.
    Un **R** indique une REINE noire, un **r** une REINE blanche.

Ecrire les deux fonctions **Piece convertir(char l)** qui convertisent un char en piece 
et **void getGame(FILE \*f, Game \*thegame)** qui remplit un Game et le retourne en fonction de ce que contient le fichier ouvert **f**.

    Le type Piece est décrit dans l'éditeur.
    Le type Game est décrit dans l'éditeur.

<div style="font-size:1em">
<details><summary>Un exemple de fichier échiquier</summary><blockquote id="odcheste" style="white-space: pre-line" 
><code><pre>{{odcheste}}</pre></code>
</blockquote></details>
</div>
==

odcheste==
VVFVVVVV
VVVTVVVV
VVVVRVVV
VVVVVVVV
VVVVtVVV
VVVrVfVV
VVVVVfVV
VVVVVVVV
==



code_before==#|c|



==

editor.code==#|c|


#include <stdio.h>

#define VIDE 0
#define TOUR 1
#define FOU 2
#define REINE 4
#define NOIR 0
#define BLANC 1

typedef struct piece
{
    int type; // TOUR FOU REINE
    int color; // NOIR BLANC
} Piece;
typedef struct
{
    Piece board[8][8];
} Game;

Piece convertir(char c)
{
    return (Piece){0,0};
}

void getGame(FILE *f, Game *thegame)
{
return ;
}



==

solution==#|c|
#include <stdio.h>

#define VIDE 0
#define TOUR 1
#define FOU 2
#define REINE 4
#define NOIR 0
#define BLANC 1

typedef struct piece
{
    int type; // TOUR FOU REINE
    int color; // NOIR BLANC
} Piece;
typedef struct
{
    Piece board[8][8];
} Game;

Piece convertir(char c)
{
    Piece p;
    switch (c)
    {

    case 'T':
    case 't':
        p.type = TOUR;
        p.color = (c == 'T') ? NOIR : BLANC;
        break;
    case 'F':
    case 'f':
        p.type = FOU;
        p.color = (c == 'F') ? NOIR : BLANC;
        break;
    case 'R':
    case 'r':
        p.type = REINE;
        p.color = (c == 'R') ? NOIR : BLANC;
        break;
    case 'V':
    default:
        p.type = VIDE;
        p.color = 0;
        break;
    }
    return p;
}

void getGame(FILE *f, Game *thegame)
{
    int i = 0;
    int j = 0;
    char str[10];
    for (i = 0; fgets(str, 10, f); i++)
    {
        for (j = 0; j < 8; j++)
        {
            char c = str[j];
            thegame->board[i][j] = convertir(c);
            // printf("%c", thegame.board[i][j].type + thegame.board[i][j].color + '0');
        }
    }
}

==

code_after==#|c|
void printGame(Game *tg)
{
    int i = 0;
    int j = 0;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            Piece p = tg->board[i][j];
            switch (p.type)
            {
            case VIDE:
                printf("_");
                break;
            case TOUR:
                printf("%c", (p.color == NOIR) ? 'T' : 't');
                break;
            case FOU:
                printf("%c", (p.color == NOIR) ? 'F' : 'f');
                break;
            case REINE:
                printf("%c", (p.color == NOIR) ? 'R' : 'r');
                break;
            default:
                printf("X=(%d)", p.type);
                break;
            }
        }
        printf("\n");
    }
}

Game thegame ;

int main(int argc, char *argv[])
{
    if (argc > 1)
    {
        FILE *f = fopen(argv[1], "r");
        
        if (f == NULL)
        {
            printf("Error opening file!\n");
            return 0;
        }

        
        getGame(f, &thegame);
        printf("Echiquier lu : \n");
        fclose(f);
        printGame(&thegame);
        return 0;
    }
    else
    {
        printf("Test de convertir \n");
        Piece p = convertir('T');
        printf("T-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('t');
        printf("t-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('F');
        printf("F-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('f');
        printf("f-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('R');
        printf("R-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('r');
        printf("r-> Type = %d, Color = %d\n", p.type, p.color);
        p = convertir('V');
        printf("V-> Type = %d, Color = %d\n", p.type, p.color);
        return 0;
    }
}
==

checks_args_stdin==#|python|
[ ["Convertir ", [], ""],
  ["Echiquier vide", ["VIDE.txt"], ""],
    ["Quelques piece ", ["TROIS.txt"], ""]
]
==

xx==
astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==

@ VIDE.txt
@ TROIS.txt 
