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
before==
import random
group.items = []

group.items.append({"id": "1", "content": "printf(\"Bonjour\n\") (le retour de cet appel)" })
group.items.append({"id": "2", "content": "54" })
group.items.append({"id": "3", "content": "malloc(53) (le retour de cet appel)" })
group.items.append({"id": "4", "content": "une variable locale" })
group.items.append({"id": "5", "content": "n'importe quelle expression non void" })
group.items.append({"id": "6", "content": "i++" })
group.items.append({"id": "7", "content": "l'adresse d'une variable" })
group.items.append({"id": "8", "content": "free (la fonction elle-même)" })

group.items.append({"id": "21", "content": "void" })
group.items.append({"id": "22", "content": "free(tab) (le retour de cet appel)" })

random.shuffle(group.items)
==

author = Nicolas Borie

title = Right values (valeur affectée) en C

tag=C|variable|affectation|valeur

text==
On appelle right value les expressions du langage C pouvant se trouver 
à droite d'un signe = (opérateur d'affectation).

<br />

Sélectionnez les right values légales dans la suite suivante.
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
    feedback = '<span class="success-state">Bravo, ce sont bien les expressions dont la valeur pourrait être stockée.</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==





