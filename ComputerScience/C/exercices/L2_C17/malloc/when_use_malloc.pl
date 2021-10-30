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

group.items.append({"id": "1", "content": "Déclarer un tableau de 4 millions d'entiers." })
group.items.append({"id": "2", "content": "Déclarer une variable plus grosse que la pile d'éxécution." })
group.items.append({"id": "3", "content": "Déclarer des tableaux de taille inconnue utilisés durant tout le programme." })
group.items.append({"id": "4", "content": "Utiliser des structures qui pourraient croitre et utiliser presque toute la RAM." })

group.items.append({"id": "21", "content": "Déclarer un tableau d'entiers dont on ne connait pas la taille d'au plus 20 cases." })
group.items.append({"id": "22", "content": "Une chaîne de caractères de longueur inconnue contenant moins de 100 lettres." })
group.items.append({"id": "23", "content": "Des structures minuscules (sizeof de moins de 16 octets)." })
group.items.append({"id": "24", "content": "Le plus souvent possible." })

random.shuffle(group.items)
==

author = Nicolas Borie

title = Bonnes utilisations de malloc.

text==
Sélectionner les circonstances pour lesquelles il est judiscieux d'avoir recours à de l'allocation dynamique.
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
    feedback = '<span class="success-state">Bravo, c\'est bien malloc qu\'on utilisera dans ces cas l&agrave;.</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==




