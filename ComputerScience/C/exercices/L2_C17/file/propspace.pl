
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

title= Lire un fichier de Coups

tag=fichier|programme|affichage|lecture

author=DR

editor.height=300px


text==#|markdown|
Écrire un programme C qui prend un argument qui sera toujours le nom d'un 
fichier positionné dans le répertoire courant et dont vous aurez les 
droits de lecture. Votre programme devra ouvrir ce fichier,
lire son contenu. 
Le contenu sont des coups aux échec où chaque ligne est de la forme   
    a2-c3   
où a et c sont des colones et 2 et 3 des lignes.  
Vous devez transformer ces coups en coordonées **Pos** pour les utilisées dans le jeu.   


Pour chaque ligne vous appelerez la fonction **void lireCoup(char \*coup, Pos \*depart, Pos \*arrive)** que vous devez écrire.


Pour afficher chaque coups vous utiliserez la fonction *prédéfinie* **printCoup(Pos a, Pos b);**.   


Ne touchez pas au code dans l'editeur qui définie les types.`
==

beforeK==
import random
def letter():
  return random.choice(['a','b','c','d','e','f','g','h'])

with open("data","w") as f :
    for x in range(1000):
      s = letter()+str(random.randint(1,8))+"-"+letter()+str(random.randint(1,8))
      print(s, file=f)


==

code_before==#|c|



==

editor.code==#|c|
#include <stdio.h>
#include <stdio.h>
/* ne pas toucher au code suivant */
typedef struct _ { int i; int j; } Pos, Dir ;

typedef struct _g { int type; int color; } Piece;
#define NOIR 0
#define BLANC 1
#define TOUR 3
#define FOU 4 
#define REINE 12

/* la fonction printCoup est prédéfinie pour ne pas avoir d'ambiguité sur le caractères invisibles*/
void printCoup(Pos a, Pos b);
/* jusqu'ici */



void lireCoup(char *in, Pos *debut, Pos *arrive)
{
...
}

int main(int argc, char* argv[]){
/* lire lefichier argv[1] ligne par ligne      */
/* pour chaque ligne lire le coup      */
/*  pour chaque coup appeler printCoup */


/* fermer le fichier */
  return 0;
}
==

solution==#|c|
#include <stdio.h>
#include <stdio.h>
/* ne pas toucher au code suivant */
typedef struct _ { int i; int j; } Pos, Dir ;

typedef struct _g { int type; int color; } Piece;
#define NOIR 0
#define BLANC 1
#define TOUR 3
#define FOU 4 
#define REINE 12

void printCoup(Pos a, Pos b);
/* jusqu'ici */



void lireCoup(char *in, Pos *debut, Pos *arrive)
{
    debut->i = in[0]-'a';
    debut->j = in[1]-'1';
    arrive->i = in[3]-'a';
    arrive->j = in[4]-'1';
}

int main(int argc, char* argv[]){
  FILE* f=fopen(argv[1], "r");
  char str[20];
  float nbs=0, nbt=0;
  Pos a,b;
  while (fgets(str, 10, f))
    { 
      lireCoup(str,&a,&b);
      
      printCoup(a,b);
    }
  fclose(f);
  return 0;
}

==

code_after==#|c|

void printCoup(Pos a, Pos b){
  printf("Coup(%d,%d)-(%d,%d)\n",a.i,a.j,b.i,b.j);
}
==

checks_args_stdin==#|python|
[ ["Simple éxécution", ["data"],""] ]
==

xx==
astuces==#|python|
[
  { "content": """La première étape consiste à ouvrir le fichier dont le nom est dans `argv[1]`. Il faudra ouvrir ce fichier en mode lecture en utilisant donc un second argument `"r"`."""},
  { "content": """La stratégie consiste à lire le fichier caractère par caractère tant que l'on atteint pas le caractère de fin de fichier EOF."""},
  { "content": """Pour code cette fonction, on peut facilement utiliser `fopen`, `fgetc`, `putchar` et `fclose`. Deux variables locales peuvent suffire : un entier pour stocker le caractère et une variable de type `FILE*`."""}
]
==

