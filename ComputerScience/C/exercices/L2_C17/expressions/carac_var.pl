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

group.items.append({"id": "1", "content": "un identificateur" })
group.items.append({"id": "2", "content": "une valeur" })
group.items.append({"id": "3", "content": "un emplacement mémoire (une adresse)" })
group.items.append({"id": "4", "content": "un type" })

group.items.append({"id": "21", "content": "un espace de noms" })
group.items.append({"id": "22", "content": "une inode" })
group.items.append({"id": "23", "content": "une classe mère" })
group.items.append({"id": "24", "content": "un groupe parent" })

random.shuffle(group.items)
==

author = Nicolas Borie

title = Caractéristiques des variables C

tag=C|variable|cours|définition

text==#|markdown|
Sélectionnez les éléments qui caractérisent les variables en C. Il s'agit donc de cocher les
éléments tels que toutes les variables en C en ont un. Mais il ne faut non plus pas trop en selectionner.
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
    feedback = '<span class="success-state">Bravo, ces quatres éléments caractérisent et décrivent entièrement une variable C.</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==




