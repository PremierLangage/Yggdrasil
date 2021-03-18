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

extends= /ComputerScience/Games/MiniBrain/mini_brain_template.pl

author=Nicolas Borie

title=Plus Grand Commun Diviseur

text==#|markdown|
<p>
Proposez un code Mini-Brain calculant le <b>PGCD</b> (le plus grand diviseur commun) de 
deux entiers. Les deux entiers seront placés en case mémoire <b>30</b> et <b>31</b> de la mémoire 
centrale. Votre code mini-brain devra placer le résultat en case <b>32</b> une fois ce 
dernier correctement calculé.
</p>
==

editor.code ==
ld $30 ...
==

before==#|python|
from random import randint

text += extra_doc

n1 = randint(8, 15)
n2 = randint(16, 31)
n3 = randint(32, 63)
n4 = randint(64, 127)
n5 = randint(128, 255)
n6 = randint(256, 511)
n7 = randint(512, 1023)
n8 = randint(512, 1023)
n9 = randint(512, 1023)
n10 = randint(512, 1023)

minibrain_action_before=[ ['décomposition de 1', 'st 1 $20'],
                          ['décomposition de 0', 'st 0 $20'],
                          ['décomposition de 7', 'st 7 $20'], ]
for n in [n1, n2, n3, n4, n5, n6, n7, n8, n9, n10]:
    minibrain_action_before.append(['décomposition de '+str(n), 'st '+str(n)+' $20'])

minibrain_action_before=str(minibrain_action_before)

minibrain_check_after=[ [(21, 1)],
                        [],
                        [(21, 1), (22, 1), (23, 1)], ]
for n in [n1, n2, n3, n4, n5, n6, n7, n8, n9, n10]:
    minibrain_check_after.append([(21+i, int(val)) for i, val in enumerate(reversed(bin(n)[2:]))])

minibrain_check_after=str(minibrain_check_after)
==

solution==

==

