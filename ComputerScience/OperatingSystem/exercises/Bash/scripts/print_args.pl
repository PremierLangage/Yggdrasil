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

def random_args():
    L = ["Pierre", "Paul", "Martin", "Jacques", "un", "deux", "trois", "quatre", "1", "192", "3.1415", "10.01"]
    return [choice(L) for i in range(randint(3, 8))]

s1 = random_args()
s2 = random_args()

test_bash = [["Test simple", ["Salut"], "Salut\n"],
["Trois arguments", ["Pierre", "Paul", "Jacques"], "Pierre\nPaul\nJacques\n"],
["Aucun argument", [], ""],
["Aléatoire", s1, "\n".join(s1) + "\n"],
["Aléatoire", s2, "\n".join(s2) + "\n"],
]
==


title=Afficher les arguments d'un script bash

text==
Écrire un script bash qui écrit sur la sortie standard les arguments que l'on 
lui a transmis en ligne de commande lors de son appel. Chaque argument devra
être écrit seul sur une ligne. Votre programme devrait donc produire autant
de ligne que le nombre d'argument que l'on lui a donné lors de son appel.
==


