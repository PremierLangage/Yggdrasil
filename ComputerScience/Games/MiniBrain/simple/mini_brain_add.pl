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

extends= /ComputerScience/Games/MiniBrain/mini_brain_template.pl

author=Nicolas Borie

title=Addition simple avec Mini-Brain


before==#|python|
text += extra_doc

from random import randint

a = randint(6, 11)
b = randint(a+1, a+6)
c = randint(b+1, b+6)

minibrain_action_before="[ "
minibrain_check_after="[ "
for i in range(5):
    val1 = randint(-50, 100)
    val2 = randint(-50, 100)
    minibrain_action_before+="['test aléatoire "+str(i+1)+"', 'st "+str(val1)+" $"+str(a)+"\\nst "+str(val2)+" $"+str(b)+"'], "
    minibrain_check_after+="[(c, "+str(val1+val2)+")], "
minibrain_check_after+="]"
minibrain_action_before+="]"
==

text==
<p>
Proposez un code Mini-Brain procédant à l'addition des données situées en case 
mémoire {{ a }} et {{ b }}. Une fois calculé, le résultat de cette addition devra 
être placé à l'adresse {{ c }}.
</p>
==

editor.code ==
...
==

solution==
PAS DE SOLUTION GENERIQUE SIMPLE

VOICI UNE SOLUTION POUR a = 9, b = 13 et c = 16

ld $9 a
add $13
st a $16    // donc $16 = $9 + $13
==

