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

title=Décomposition en base 2 d'un entier

text==#|markdown|
<p>
Proposez un code Mini-Brain <b>décomposant en base deux</b> l'entier 
stocké à la case 20 de la mémoire centrale. Placez vos résultats dans 
les cases 21 jusque 30. La valeur en case 20 sera toujours un entier 
positif sur 10 bits maximum.
</p>
<br>
<p>
Placezles bits de poids faible à partir de la case 21. Pas besoin de
compléter avec des bits nul devant pour occuper les 10 cases de 21 à 
30 inclus, les bits nuls en tête de nombre ne sont ni nécessaires, ni
pénalisants si votre programme les place.
</p>
==

editor.code ==
ld $20 ...
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
ld $20 a
ld 20 #0
inc #0
div 2
st 1 $#0
bfdn 8
st 0 $#0
cmp 0
bfdn 3
==


