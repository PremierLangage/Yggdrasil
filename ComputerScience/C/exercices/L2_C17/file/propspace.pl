
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

title=Vers l'infini et au-delà

tag=fichier|programme|affichage|lecture

author=DR

editor.height=300px


text==#|markdown|
Écrire un programme C qui prend un argument qui sera toujours le nom d'un 
fichier positionné dans le répertoire courrant et dont vous aurez les 
droits de lecture. Votre programme devra ouvrir ce fichier,
lire son contenu des coups aux échec et afficher les coordonées de chaque coup.   

chaque ligne est de forme   
    a2-c3   
où a et c sont des colones et 2 et 3 des lignes.  

Pour chaque ligne vous appelerez la fonction **void lireCoup(char *coup, Pos *depart, Pos *arrive)**

Pour afficher les coups on utilisera la fonction *prédéfinie* 
**printCoup(Pos a, Pos b);**

Ne touchez pas au code au dessus de vos fonctions.`
==

code_before==#|c|



==

editor.code==#|c|
#include <stdio.h>
// ne pas toucher au code suivant 
typedef struct _ { int i, int j; } Pos, Dir ;

typedef struct _g { int type; int color; } Piece , Game[8][8];
#define NOIR 0
#define BLANC 1
#define TOUR 3
#define FOU 4 
#define REINE 12

void printCoup(Pos a, Pos b);
// jusqu'ici

void lireCoup(char *coup, Pos *depart, Pos *arrive){
    ...
}


int main(int argc, char* argv[]){
  Pos un,deux;


    printCoup(un,deux);

}
==

solution==#|c|
#include <stdio.h>

#include <stdio.h>
// ne pas toucher au code suivant 
typedef struct _ { int i, int j; } Pos, Dir ;

typedef struct _g { int type; int color; } Piece , Game[8][8];
#define NOIR 0
#define BLANC 1
#define TOUR 3
#define FOU 4 
#define REINE 12

void printCoup(Pos a, Pos b);
// jusqu'ici



void lireCoup(char *in, POS *debut, POS *arrive)
{
    debut->i = in[0]-'a';
    debut->j = in[1]-'1';
    arrive->i = in[3]-'a';
    arrive->j = in[4]-'1';
}

int main(int argc, char* argv[]){
  FILE* f=fopen(argv[1], "r");
  int c;
  char str[20];
  float nbs=0, nbt=0;
  Pos a,b;
  while ((c = fgets(str, 10, f) != EOF)
    { 
      lireCoup(str,&a,&b);
      printCoup(a,b);
    }
  fclose(f);
  printf("Proportion d'espaces : %5.2f%%\n", (nbs/nbt)*100); 
  return 0;
}

==

code_after==#|c|

void printCoup(Pos a, Pos b){
  printf("Coup(%d,%d)-(%d,%d)\n",a.i,a.j,b.i,b.j);
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["f1.txt"], ""],
  ["Fichier vide", ["f3.txt"], ""],
  ["Test aléatoire 1", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""],
  ["Test aléatoire 2", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""],
  ["Test aléatoire 3", [choice(["f2.txt", "f4.txt", "f5.txt", "f6.txt", "titi", "toto"])], ""] ]
==

xx==
astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==

