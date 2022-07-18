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
s3 = random_args()

test_bash = [["simple", ["Salut"], "Salut\n"],
["trois arguments", ["Pierre", "Paul", "Jacques"], "Jacques\nPaul\nPierre\n"],
["aucun argument", [], ""],
["aléatoire", s1, "\n".join(reversed(s1)) + "\n"],
["aléatoire", s2, "\n".join(reversed(s2)) + "\n"],
["aléatoire", s3, "\n".join(reversed(s3)) + "\n"],
]
==

author=Nicolas Borie
title=Un script bash qui affiche ses arguments dans l'ordre inverse !

text==
Écrire un script bash qui écrit sur la sortie standard les arguments que l'on 
lui a transmis en ligne de commande lors de son appel mais **dans l'ordre inverse**. 
Chaque argument devra être écrit seul sur une ligne en commançant par le dernier. 
Votre programme devrait donc produire autant de ligne que le nombre d'argument 
que l'on lui a donné lors de son appel.
==

solution==
#!/bin/bash

for (( i=$#;i!=0;i-- ));do
        echo "${!i}"
done
==

