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

extends=mini_brain_template.pl

author=Nicolas Borie

title=Remplir la mémoire du Mini-Brain

text==
<p>
Proposez un code Mini-Brain qui place la valeur 42 dans toutes les case mémoires de
la case 10 à case 15 toutes deux incluses.
</p>
==

editor.code ==
ld $10 ...
==

minibrain_action_before==
[ ['factorielle de 1', ''], ]
==

minibrain_check_after==
[ [(10, 42), (11, 42), (12, 42), (13, 42), (14, 42), (15, 42)] ]
==




