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

title=Somme d'une plage de valeurs avec Mini Brain


before==#|python|
text += extra_doc

from random import randint

a = randint(20, 30)
b = randint(a+5, a+10)
c = randint(b+1, b+5)
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
<p>
Proposez un code Mini-Brain qui additionne les valeurs situées dans les cases 
mémoires de l'indice {{ a }} à l'indice {{ b }} toutes deux incluses. Une 
fois cette somme calculée, placez le résultat dans la case mémoire à 
l'adresse {{ c }}.
</p>
==

editor.code ==
...
==





