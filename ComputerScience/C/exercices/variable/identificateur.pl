# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
#

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
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
==

author = Nicolas Borie
title = Identificateurs des variables en C

text==
Sélectionnez les identificateurs valides pour une variable en C.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
right = 0
total = 0
error = 0
for item in group.items:
    checked = item['checked']
    id_int = int(item['id'])
    if id_int < 20:
        total += 1
        item['css'] = 'error-state'
        if checked:
            right += 1
            item['css'] = 'success-state'
    elif checked:
        error += 1
        item['css'] = 'error-state'

nb_error = error + (total - right)
note = 100*((max([0, total-nb_error])) / total)

if nb_error == 0:
    feedback = '<span class="success-state">Bravo, ce sont bien les identificateurs possibles de variables!</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==


