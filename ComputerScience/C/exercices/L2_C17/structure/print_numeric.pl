#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Introduction aux types polymorphes

tag=structure|imbriquées|complexe|polymorphe|générique|énumération|type

editor.height=420px

text==
Dans cet exercice, il est étudié la possibilité de faire un peu d'informatique 
générique en C. Ici, deux types ont été définis pour essayer de faire 
un *type polymorphe* pouvant représenter à la fois un entier, un nombre réel voire 
un nombre complexe.

<br>

L'union (aussi rare soit son utilisation) permet de fusionner plusieurs concepts 
ou types en un seul. Ici, un **Numeric** est une structure qui contient son 
type (qui appartient à une énumération) puis une union anonyme permettant d'être 
possiblement une donnée d'un des trois types énumérés.

<br>

Dans cet exercice, la seule chose à coder est une **fonction d'affichage générique**
qui s'adapte à la donnée en argument. Si la donnée est un nombre entier, procédez 
à un affichage décimal `"%d"` de la donnée entière. Si la donnée est un nombre 
réel, faites un affichage standard `"%f"` de la donnée flottante. Enfin, pour un 
nombre complexe, on force l'affiche du signe de la partie imaginaire avec le motif 
`"%f%+f*i"` Le premier floattant de la donnée sera la partie réelle et la seconde 
partie sera la partie imaginaire (les signes moins sont toujours affichés 
naturellement mais `"%+f"` force l'affichage d'un `+` lorsque le floattant est 
positif).
==

editor.code==#|c|
#include <stdio.h>

typedef enum {integer, real, complex} NumType;

typedef struct{
  NumType type;
  union{
    int integer;
    float real;
    float complex[2];
  };
}Numeric;

void print_numeric(Numeric* n){
  /* Votre code ici... */
}
==

solution==#|c|
#include <stdio.h>

typedef enum {integer, real, complex} NumType;

typedef struct{
  NumType type;
  union{
    int integer;
    float real;
    float complex[2];
  };
}Numeric;

void print_numeric(Numeric* n){
  if (n->type == integer)
    printf("%d", n->integer);
  else if (n->type == real)
    printf("%f", n->real);
  else
    printf("%f%+f*i", n->complex[0], n->complex[1]);
}
==

code_before==#|c|
#define _POSIX_C_SOURCE 200112L
==

code_after==#|c|
#include <stdlib.h>

int main(int argc, char* argv[]){
  Numeric n;

  n.type = atoi(argv[1]);
  if (n.type == integer)
    n.integer = atoi(argv[2]);
  else if (n.type == real)
    n.real = strtof(argv[2], NULL);
  else{
    n.complex[0] = strtof(argv[2], NULL);
    n.complex[1] = strtof(argv[3], NULL);
  }

  printf("Affichage de la donnée numérique générique : ");
  print_numeric(&n);
  putchar('\n');
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Entier simple", ["0", "42"], ""],
  ["Nombre réel", ["1", "3.141592"], ""],
  ["Nombre complexe", ["2", "3", "-3"], ""],
  ["Entier aléatoire", ["0", str(randint(-100, 100))], ""],
  ["Nombre réel aléatoire", ["1", str( 50*(random()-0.5) )], ""],
  ["Nombre complexe aléatoire", ["2", str( 50*(random()-0.5) ), str( 50*(random()-0.5) )], ""],
  ["Donnée numérique aléatoire 1", [str(randint(0,2)), str( 20*(random()-0.5) ), str( 20*(random()-0.5) )], ""],
  ["Donnée numérique aléatoire 2", [str(randint(0,2)), str( 20*(random()-0.5) ), str( 20*(random()-0.5) )], ""],
  ["Donnée numérique aléatoire 3", [str(randint(0,2)), str( 20*(random()-0.5) ), str( 20*(random()-0.5) )], ""],
  ["Donnée numérique aléatoire 4", [str(randint(0,2)), str( 20*(random()-0.5) ), str( 20*(random()-0.5) )], ""],
  ["Donnée numérique aléatoire 5", [str(randint(0,2)), str( 20*(random()-0.5) ), str( 20*(random()-0.5) )], ""] ] 
==

astuces==#|python|
[
  { "content": """Comprendre la structure est la chose la plus difficile de l'exercice. Ici, on tente de définir un type générique qui pourrait représenter tout nombre : un type polymorphe."""},
  { "content": """Le coeur de la fonction est simplissime en fait : suivant la valeur de l'`enum`, on appelle le `printf` qui va bien. Pour coder cette fonction, il suffit donc de placer trois appels corrects à `printf` dans une conditionnelle (soit avec des `if`, soit avec un `switch`)."""}
]
==

