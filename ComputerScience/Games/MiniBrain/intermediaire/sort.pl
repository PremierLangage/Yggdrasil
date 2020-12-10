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

title=Trier une plage de valeurs avec Mini Brain


before==#|python|
text += extra_doc

from random import randint

minibrain_action_before="[ "
minibrain_check_after="[ "
for i in range(5):
    pre_actions_list = []
    vect_val = []
    for j in range(b - a + 1):
        vect_val.append(randint(-50, 100))
        pre_actions_list.append("st "+str(vect_val[-1])+" $"+str(a+j))
    minibrain_action_before+="['test aléatoire "+str(i+1)+"', '"+ "\\n".join(pre_actions_list) +"'], "
    minibrain_check_after+="[(c, "+str(sum(vect_val))+")], "

minibrain_check_after+="]"
minibrain_action_before+="]"
==

text==
Proposez un code Mini-Brain qui trie les valeurs situées entre les case **50**
et **60** toutes deux incluses de la mémoire.

<br>

Quelque soit l'algorithme choisi, ceci reste un exercice difficile.
==

editor.code ==
...
==


solution==

==



