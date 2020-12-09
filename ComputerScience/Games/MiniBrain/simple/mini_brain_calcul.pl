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

title=Calcul simple avec Mini-Brain


before==#|python|
text += extra_doc

from random import randint

a = randint(10, 15)
b = randint(a+1, a+6)

minibrain_action_before="[ "
minibrain_check_after="[ "
for i in range(5):
    val = randint(0, 200)
    minibrain_action_before+="['test aléatoire "+str(i+1)+"', 'st "+str(val)+" $"+str(a)+"'], "
    minibrain_check_after+="[(b, "+str( (val*(val+1)) // 2)+")], "
minibrain_check_after+="]"
minibrain_action_before+="]"
==

text==
Proposez un code Mini-Brain qui récupère $% n %$ la valeur située à l'adresse 
{{ a }} et qui calcule la formule $% \frac{n(n+1)}{2} %$, une fois le calcul 
établi, placez le résultat dans la case mémoire {{ b }}.

==

editor.code ==
...
==

solution==
PAS DE SOLUTION GENERIQUE SIMPLE

VOICI UNE SOLUTION POUR a = 15 et b = 18

ld $15 a
mv a #0
inc #0
mul #0
div 2
st a $18

==




