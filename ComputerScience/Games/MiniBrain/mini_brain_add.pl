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

title=Addition simple avec Mini-Brain


before==#|python|
text += extra_doc

from random import randint

val1 = randint(-50, 100)
val2 = randint(-50, 100)
a = randint(2, 2+5)
b = randint(a, a+5)
c = randint(b, b+5)

minibrain_action_before=[ ['test simple aléatoire', 'st '+str(val1)+' $'+str(a)+'\nst '+str(val2)+' $'+str(b)] ]

minibrain_check_after = [ [(c, val1+val2)] ]

==

text==
<p>
Proposez un code Mini-Brain procédant à l'addition des données situées en case 
mémoire {{ a }} et {{ b }}. Une fois calculé, le résultat de cette addition devra 
être placé à l'adresse {{ c }}.
</p>
==

editor.code ==
ld $10 ...
==

