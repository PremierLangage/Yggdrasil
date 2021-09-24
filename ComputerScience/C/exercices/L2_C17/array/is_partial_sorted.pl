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

title=Tableau partiellement trié
tag=array|fonction|parcours|index


before ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]

# Voici une manière de générer un énoncé aléatoire
taille_tab = 20
index_min = randint(0,8)
index_max = randint(12,19)
ordre_croissant = randint(0,1)

# un mot pour l'énoncé en francais (construit depuis le booléan aléatoire)
mot_croissant = 'croissante' if ordre_croissant == 1 else 'décroissante'

# Ici, on génére une solution C dédié à l'exercice aléatoire avec du Python 
# This is fucking insane man !!!
solution = "int est_partie_triee(int* tab){"
solution += "  int i;"
solution += "  for (i="+str(index_min)+" ; i<"+str(index_max)+" ; i++){"
solution += "    if (tab[i+1] "+('<' if ordre_croissant == 1 else '>')+" tab[i]){"
solution += "      return 0;}}"
solution += "  return 1;"
solution += "}"

if "taboo" in globals(): 
    text+='<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    text+="<b>Taboo :</b> attention, il y aura un refus de compilation si vous proposez un code qui utilise les mots suivants (ne les mentionnez pas ni en fonction, ni en nom de variable) : "
    text+=str(taboo)
    text+='</div> <br />\n'

if "astuces" in globals():
    hints.items = eval(astuces)
    text+='<br><br>'
    text+=" {{ hints|component}} \n<br>"
    nb_hints = len(hints.items)
else:
    nb_hints = 0

text+=" {{ editor|component }} "
==

text==
Écrire une fonction C **est_partie_triee** qui prend en argument un tableau 
d'entiers `tab`. Votre fonction de devra retourner `1` si le tableau `tab` 
est trié de manière **{{ mot_croissant }}** entre les indices 
**{{ index_min }}** et **{{ index_max }}** tous deux inclus.

<br />

<b><u>Attention :</u></b> pour vérifier qu'un tableau de taille `N` est trié, on ne 
doit procéder qu'à `N-1` tests ; faites donc bien attention aux bords de vos boucles le 
cas échéant.
==

editor.code==#|c|
int est_partie_triee(int* tab){
  /* Votre code ici... */
}
==


code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
int main(int argc, char* argv[]){
  int* tab = (int*)malloc(argc*sizeof(int));
  int i;

  for (i=1 ; i<argc ; i++){
    tab[i-1] = atoi(argv[i]);
  }

  if (est_partie_triee(tab)){
    printf("Oui, c'est effectivement trié entre les deux indices.\n");
  }
  else{
    printf("Non, ce n'est pas trié entre les deux indices.\n");
  }

  free(tab);
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Liste croissante simple", [str(i) for i in range(20)], ""],
  ["Liste décroissante simple", [str(i) for i in range(19, -1, -1)], ""],
  ["Liste croissante aléatoire", list(map(lambda x: str(x), sorted([randint(-10, 10) for i in range(20)]))), ""],
  ["Liste décroissante aléatoire", list(map(lambda x: str(x), sorted([randint(-10, 10) for i in range(20)], reverse=True))), ""],
  ["Test aléatoire croissant localement", [str(randint(-10, 10)) for i in range(index_min)]+list(map(lambda x: str(x), sorted([randint(-10, 10) for i in range (index_max - index_min + 1)])))+[str(randint(-10, 10)) for i in range(19-index_max)], "" ],
  ["Test aléatoire décroissant localement", [str(randint(-10, 10)) for i in range(index_min)]+list(map(lambda x: str(x), sorted([randint(-10, 10) for i in range (index_max - index_min + 1)], reverse=True)))+[str(randint(-10, 10)) for i in range(19-index_max)], "" ],
  ["Test aléatoire 1", [str(randint(-10, 10)) for i in range(20)], ""],
  ["Test aléatoire 2", [str(randint(-10, 10)) for i in range(20)], ""],
  ["Test aléatoire 3", [str(randint(-10, 10)) for i in range(20)], ""],
  ["Test aléatoire 4", [str(randint(-10, 10)) for i in range(20)], ""] ]
==

astuces==#|python|
[
  { "content": """"""},
  { "content": """"""},
  { "content": """"""}
]
==

