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
    if c > b or b < a or b < a:
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
 ["simple", ["2", "3", "1"], "1 n'est pas compris entre 2 et 3.\n"], 
 ["simple", ["1", "2", "3"], "3 n'est pas compris entre 1 et 2.\n"], 
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
Écrire un script bash qui attend trois paramètres entiers. Si le troisi

==




