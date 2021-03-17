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
les cases 21 jusque 28. La valeur en case 20 sera toujours un entier 
positif sur 8 bits maximum.
</p>
==

editor.code ==
ld $20 ...
==

minibrain_action_before==
[ ['décomposition de 1', 'st 1 $20'],
  ['décomposition de 0', 'st 0 $20'],
  ['décomposition de 7', 'st 7 $20'], ]
==

minibrain_check_after==
[ [(21, 1)],
  [],
  [(21, 1), (22, 1), (23, 1)], ]
==

solution==
ld $20 ...
==


