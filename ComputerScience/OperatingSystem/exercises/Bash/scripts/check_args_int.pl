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

extends=script_template.pl

before==#|python|
from random import choice, randint

def soluce(a, b, c):
    if (c > b) or (c < a) or (b < a):
        return str(c)+" n'est pas compris entre "+str(a)+" et "+str(b)+".\n"
    else:
        return "La contrainte "+str(a)+" <= "+str(c)+" <= "+str(b)+" est vérifiée.\n"

L1 = [randint(1,60), randint(40,100), randint(1,100)]
L2 = [randint(1,60), randint(40,100), randint(1,100)]
L3 = [randint(1,60), randint(40,100), randint(1,100)]
L4 = [randint(1,60), randint(40,100), randint(1,100)]
L5 = [randint(1,60), randint(40,100), randint(1,100)]
L6 = [randint(1,60), randint(40,100), randint(1,100)]


test_bash = [ ["simple", ["1", "3", "2"], "La contrainte 1 <= 2 <= 3 est vérifiée.\n"], 
 ["trop petit", ["2", "3", "1"], "1 n'est pas compris entre 2 et 3.\n"], 
 ["trop grand", ["1", "2", "3"], "3 n'est pas compris entre 1 et 2.\n"], 
 ["mauvais ordre", ["3", "1", "2"], "2 n'est pas compris entre 3 et 1.\n"], 
 ["aléatoire", [str(i) for i in L1], soluce(*L1)],
 ["aléatoire", [str(i) for i in L2], soluce(*L2)],
 ["aléatoire", [str(i) for i in L3], soluce(*L3)],
 ["aléatoire", [str(i) for i in L4], soluce(*L4)],
 ["aléatoire", [str(i) for i in L5], soluce(*L5)],
 ["aléatoire", [str(i) for i in L6], soluce(*L6)], 
]
==

author=Nicolas Borie
title=Script qui vérifie un encadrement de valeurs

text==
Écrire un script bash qui attend trois paramètres entiers. Si le troisième 
argument **c** est supérieur ou égal au premier **a** et inférieur ou égal au second 
**b**; alors votre script devra inscrire sur la sortie standard :
**La contrainte a <= c <= b est vérifiée.** Dans tous les autres cas, votre script
devra afficher le message suivant : **c n'est pas compris entre a et b.** 
(bien sûr il s'agit de remplacer a, b et c par les bonnes valeurs que 
prennent les trois paramètres durant l'exécution.
==

solution==#|shell|
if [ $1 -le $3 ]
  then
    if [ $3 -le $2 ]
      then
        echo "La contrainte $1 <= $3 <= $2 est vérifiée."
      else
        echo "$3 n'est pas compris entre $1 et $2."
    fi
  else
    echo "$3 n'est pas compris entre $1 et $2."
fi
==


