#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random
group.items = []

group.items.append({"id": "1", "content": "small_tree" })
group.items.append({"id": "2", "content": "s_p_s_" })
group.items.append({"id": "3", "content": "call" })
group.items.append({"id": "4", "content": "__" })
group.items.append({"id": "5", "content": "max3" })
group.items.append({"id": "6", "content": "_one" })

group.items.append({"id": "21", "content": "3call" })
group.items.append({"id": "22", "content": "12ABA21" })
group.items.append({"id": "23", "content": "7_car" })

random.shuffle(group.items)

note=None
==

author = Nicolas Borie
title = Identificateurs des variables en C

tag=C|variable|identificateurs|compilation

text==
Sélectionnez les identificateurs valides pour une variable C.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
form+="""

<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

right = 0
total = 0
error = 0
for item in group.items:
    checked = item['checked']
    id_int = int(item['id'])
    total += 1
    if id_int < 20:
        item['css'] = 'error-state'
        if checked:
            right += 1
            item['css'] = 'success-state'
        else:
            error += 1
    elif checked:
        error += 1
        item['css'] = 'error-state'
    else:
        item['css'] = ''

nb_error = error
if note is None:
    note = (100*(max([0, total-nb_error]))) // total

feedback = "Note finale : "+str(note)+" / 100<br><br>"

if nb_error == 0:
    feedback += '<span class="success-state">Bravo, ce sont bien les identificateurs possibles de variables!</span>'
else:
    feedback += '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==




