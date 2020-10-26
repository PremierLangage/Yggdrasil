#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Allocation d'une structure Couleur avec 3 entiers
tag=structure|malloc|function

text==
Déclarer et définir un nouveau type structuré C nommé **Color**. 
Cette structure devra contenir trois champs entiers nommés 
**red** pour rouge, **green** pour vert et **blue** pour bleu.

Écrire ensuite une fonction **allocate_color** qui prend trois 
entiers en paramètres `R`, `G`, `B` et qui retourne l'adresse d'une 
nouvelle structure **Color** fraichement allouée avec **malloc** et
initialisée avec les trois entiers bien renseignés dans les champs 
`R` pour **red**, `G` pour **green**, et `B` pour **blue**.
==

editor.code==#|c|
typedef ...
...
... Color;

... allocate_color(... R, ... G, ... B){
  ... malloc ...
}

==

solution==#|c|
typedef struct coco{
  int red;
  int green;
  int blue;
}Color;

Color* allocate_color(int R, int G, int B){
    Color *p=(Color *)malloc(sizeof(struct coco));

    p->red = R ;
    p->green = G;
    p->blue = B;
    return p;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
Color *s;

  s = allocate_color(atoi(argv[2]), atoi(argv[3]), atoi(argv[4]));
  printf("%s", argv[1]);
  printf(" : (%d, %d, %d)\n", s->red, s->green, s->blue);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Test simple rouge", ["Rouge", "255", "0", "0"], ""],
	["Test simple bleu", ["Bleu 0 0 255"], ""],
  ["Test simple violet", ["Violet 255 0 255"], ""],
	["Test simple noir", ["Noir 0 0 0"], ""],
  ["Couleur aléatoire 1", ["Couleur aléatoire"] + [str(random.randint(0,255)) for i in range(3)], ""],
  ["Couleur aléatoire 2", ["Couleur aléatoire"] + [str(random.randint(0,255)) for i in range(3)], ""],
  ["Couleur aléatoire 3", ["Couleur aléatoire"] + [str(random.randint(0,255)) for i in range(3)], ""] ]
==




