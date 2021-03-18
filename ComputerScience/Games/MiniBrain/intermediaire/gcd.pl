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
dernier correctement calculé. Bon courage.
</p>
==

editor.code ==
ld $30 ...
==

before==#|python|
from random import randint

text += extra_doc

n1 = randint(8, 15)

minibrain_action_before=[ ['décomposition de 1', 'st 1 $20'] ]

minibrain_action_before=str(minibrain_action_before)

minibrain_check_after=[ [(21, 1)] ]

minibrain_check_after=str(minibrain_check_after)
==

solution==

==

