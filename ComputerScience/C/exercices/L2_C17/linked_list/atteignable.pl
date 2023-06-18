



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

title= Atteignable 

tag=fichier|programme|affichage|lecture

author=DR

editor.height=300px


text==#|markdown|

On souhaite écrire une fonction vérifiant la validité du déplacement d’une pièce. Pour cela, nous utiliserons la notion de direction (structure Dir) :

    {−1, 1}  {0, 1}  {1, 1}
    {−1, 0}  {0, 0}  {1, 0}
    {−1, −1} {0, −1} {1, −1}


Écrire une fonction **Dir atteignable(Game *g, Pos d, Pos a)**
 qui teste si la piece en position de depart **d** peut être déplacé en position d'arrivée **a** sur un échiquier vide,
 retourne la direction 0,0 si ce n'est pas possible. 




Ne touchez pas au code au dessus de vos fonctions.`
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


int sens(int x, int y){
    if (x==y) return 0;
    if (x <y ) return 1;
    return -1;
}
/* ne pas modifier au dessus */

Dir atteignable(Game *g, Pos d, Pos a)
{
return (Dir){0,0};
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

Piece _piece_en(Game *G, Pos p)
{
    return G->board[p.i][p.j];
}


int sens(int x, int y){
    if (x==y) return 0;
    if (x <y ) return 1;
    return -1;
}


Dir atteignable(Game *J, Pos depart, Pos arrivee)
{
    Piece p = J->board[depart.i][depart.j];
    switch (p.type)
    {
    case TOUR:
        if (!(depart.i == arrivee.i || depart.j == arrivee.j))
            return (Dir){0, 0};
        break;
    case FOU:
        if (!((depart.i - arrivee.i == depart.j - arrivee.j) || (depart.i + arrivee.i == depart.j + arrivee.j)))
            return (Dir){0, 0};
        break;
    case REINE:
        if (!((depart.i == arrivee.i || depart.j == arrivee.j) || (depart.i - arrivee.i == depart.j - arrivee.j) || (depart.i + arrivee.i == depart.j + arrivee.j)))
            return (Dir){0, 0};
        break;
    }
    return (Dir){sens(depart.i, arrivee.i), sens(depart.j, arrivee.j)};
}


==

code_after==#|c|



void _place_piece(Game *J, int t, int c, Pos p)
{
    J->board[p.i][p.j].type = t;
    J->board[p.i][p.j].color = c;
}

int main(int argc, char const *argv[])
{

    // test de attteignable
    printf(" Test de attteignable Tour Noire en 0,0 \n");
    Game thegame = {0};
    _place_piece(&thegame, TOUR, NOIR, (Pos){0, 0});
    Dir a = atteignable(&thegame, (Pos){0, 0}, (Pos){0, 7});
    printf("Dir vers 0,7 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){0, 0}, (Pos){7, 7});
    printf("Dir vers 7,7: %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){0, 0}, (Pos){7, 0});
    printf("Dir vers 7,0 : %d %d\n", a.i, a.j);
    printf(" Test de attteignable FOU  en 3,3 \n");
    _place_piece(&thegame, FOU, NOIR, (Pos){3, 3});
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){0, 0});
    printf("Dir vers 0,0 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){7, 7});
    printf("Dir vers 7,7 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){7, 0});
    printf("Dir vers 7,0 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){2,5});
    printf("Dir vers 2,5 : %d %d\n", a.i, a.j);
    printf(" Test de attteignable REINE  en 3,3 \n");
    _place_piece(&thegame, REINE, NOIR, (Pos){3, 3});
    printf(" Test depart == arrive  ");
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){3, 3});
    printf((a.i == 0 && a.j == 0) ? "OK\n" : "KO\n");
    printf(" Test de attteignable REINE  en 3,3 \n");
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){0, 0});
    printf("Dir vers 0,0 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){7, 7});
    printf("Dir vers 7,7 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){7, 0});
    printf("Dir vers 7,0 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){4, 5});
    printf("Dir vers 4,5 : %d %d\n", a.i, a.j);
    a = atteignable(&thegame, (Pos){3, 3}, (Pos){3, 2});
    printf("Dir vers 3,2 : %d %d\n", a.i, a.j);
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

