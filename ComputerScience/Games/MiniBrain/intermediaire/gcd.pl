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

title=PGCD : Plus Grand Commun Diviseur

text==#|markdown|

<p>
Proposez un code Mini-Brain calculant le <b>PGCD</b> (le plus grand diviseur commun) de 
deux entiers. Les deux entiers seront placés en case mémoire <b>30</b> et <b>31</b> de la mémoire 
centrale. Votre code mini-brain devra placer le résultat en case <b>32</b> une fois ce 
dernier correctement calculé. Bon courage.
</p>
<br>
<p>
Pour information, l'algorithme ultra naif et linéaire qui égrène les entiers 
de manière croissante en mettant à jour le plus grand entier divisant les deux entiers 
en argument ne fonctionnera pas (il lui faut plus de 8 minutes pour passer tous les tests, 
donc timeout).
</p>

==

editor.code ==
ld $30 ...
==

before==#|python|
from random import randint
from math import gcd

text += extra_doc

data= []
for i in range(5):
    min_pgcd = randint(1, 30)
    a = min_pgcd*randint(1, 100)
    b = min_pgcd*randint(1, 100)
    pgcd = gcd(a, b)
    data.append((a, b, pgcd))

minibrain_action_before=[ ['pgcd de 10 et 10', 'st 10 $30\nst 10 $31'], 
                          ['pgcd de 5 et 7', 'st 5 $30\nst 7 $31'], 
                          ['pgcd de 897 et 897', 'st 897 $30\nst 897 $31'],
                          ['pgcd de 4083 et 9527', 'st 4083 $30\nst 9527 $31'],
                          ['pgcd de 23513 et 23534', 'st 23513 $30\nst 23534 $31'],
                          ['pgcd de 16614 et 9594', 'st 16614 $30\nst 9594 $31'],
                          ['pgcd de 11865 et 6783', 'st 11865 $30\nst 6783 $31'], ]

for i in range(5):
    a, b, pgcd = data[i]
    name_test = 'pgcd de '+str(a)+' et '+str(b)
    action_before = 'st '+str(a)+' $30\nst '+str(b)+' $31'
    minibrain_action_before.append([name_test, action_before])

minibrain_action_before=str(minibrain_action_before)

minibrain_check_after=[ [(32, 10)], 
                        [(32, 1)], 
                        [(32, 897)], 
                        [(32, 1361)],
                        [(32, 7)],
                        [(32, 234)],
                        [(32, 21)], ]

for i in range(5):
    a, b, pgcd = data[i]
    minibrain_check_after.append([(32, pgcd)])

minibrain_check_after=str(minibrain_check_after)
==

solution_naive==
# ne fonctionne pas car trop gourmande en général
# on part de 1 et on monte jusqu'au minimun
# on update le registre #3 quand on trouve un div commun
ld $30 #0
ld $31 #1
ld 1 #2
ld 1 #3
inc #2
mv #0 a
div #2
bfdn 13
mv #1 a
div #2
bfdn 13
mv #2 #3
mv #0 a
cmp #2
bfup 20
mv #1 a
cmp #2
bfup 20
bnow 5
st #3 $32
==

solution==
ld $30 #0
ld $31 a
cmp #0
bfup 8
mv #0 #1
mv a #0
bnow 9
mv a #1
mv #0 a
mod #1
bfup 15
mv #1 #0
mv a #1
bnow 9
st #1 $32
==
