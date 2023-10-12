


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

title= Lire un echiquier 

tag=fichier|programme|affichage|lecture

author=DR

editor.height=300px


text==#|markdown|

Ecrire les deux fonctions **void place_piece(Game \*g, Piece p)** et **Piece piece_en(Game \*jeu,Pos case)**
qui respectivement ajoute la pièce `p` au jeu et lit la piece à la position `case` du jeu.


Ne touchez pas au code au dessus de vos fonctions.
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

typedef struct {
    int type;
    int color;
} Piece;

typedef struct {
    Piece board[8][8];
} Game;

typedef struct {
    int i;
    int j;
} Pos,Dir;
/* ne pas modifier le code précédent */

Piece piece_en(Game *G, Pos p)
{
    
}

void place_piece(Game *J, int t, int c, Pos p)
{

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
    int type;
    int color;
} Piece;
typedef struct
{
    Piece board[8][8];
} Game;
typedef struct
{
    int i;
    int j;
} Pos,Dir;

Piece piece_en(Game *G, Pos p)
{
    return G->board[p.i][p.j];
}

void place_piece(Game *J, int t, int c, Pos p)
{
    J->board[p.i][p.j].type = t;
    J->board[p.i][p.j].color = c;
}
==

code_after==#|c|

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
        printf("\n");
        for (j = 0; j < 8; j++)
        {
            char c = str[j];
            thegame->board[i][j] = convertir(c);
            // printf("%c", thegame.board[i][j].type + thegame.board[i][j].color + '0');
        }
    }
}
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


void printPiece(Piece x)
{
    printf("Piece : type = %d, color = %d\n", x.type, x.color);
    switch (x.type)
    {
    case VIDE:
        printf("VIDE\n");
        break;
    case TOUR:
        printf("TOUR ");
        printf(x.color == NOIR ? "NOIRE\n" : "BLANCHE\n");
        break;
    case FOU:
        printf("FOU");
        printf(x.color == NOIR ? "NOIR\n" : "BLANC\n");
        break;
    case REINE:
        printf("REINE");
        printf(x.color == NOIR ? "NOIRE\n" : "BLANCHE\n");
        break;
    default:
        printf("X=(%d)\n", x.type);
        break;
    }
}

int main(int argc, char const *argv[])
{

Game thegame = {0};

printf(" je place la tour noire dans le coin \n");
place_piece(&thegame, TOUR, NOIR, (Pos){0, 0});
printf(" il y a une tour noire dans le coin ?\n");
printPiece(piece_en(&thegame, (Pos){0, 0}));
printf(" Des tours noire et blanches alignées sur la diagonale ?\n");

for (int i = 0; i < 8; i++)
{
    place_piece(&thegame, TOUR, i % 2 ? NOIR : BLANC, (Pos){i, i});
}
printGame(&thegame);
return 0;

}
==

checks_args_stdin==#|python|
[ ["Place piece  ", [], ""]]
==

xx==
astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==

