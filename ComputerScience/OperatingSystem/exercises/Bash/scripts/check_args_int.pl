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
    if c > b or b < a:
        return str(c)+" n'est pas compris entre "+str(a)+" et "+str(b)
    else:
        return "La contrainte "+str(a)+" <= "+str(c)+" <= "+str(b)+" est vérifiée."

test_bash = [["simple", ["Salut"], "Salut\n"],
["trois arguments", ["Pierre", "Paul", "Jacques"], "Jacques\nPaul\nPierre\n"],
["aucun argument", [], ""],
["aléatoire", s1, "\n".join(reversed(s1)) + "\n"],
["aléatoire", s2, "\n".join(reversed(s2)) + "\n"],
["aléatoire", s3, "\n".join(reversed(s3)) + "\n"],
]
==

author=Nicolas Borie
title=Script qui vérifie un encadrement de valeurs

text==
Écrire un script bash qui attend trois paramètres entiers. Si le troisi

==




