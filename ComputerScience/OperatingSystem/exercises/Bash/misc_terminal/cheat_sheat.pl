#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie

title=Les réflexes salutaires en terminal

tag=réflexes|bonnes pratiques|terminal|unix

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []

group.items.append({"id": "g1", "content": "Utiliser au maximum la tab-completion pour éviter les fautes de frappe."})
group.items.append({"id": "g2", "content": "Rappeler les commandes avec les flèches plutôt que de les retaper."})
group.items.append({"id": "g3", "content": "Ne jamais oublier que le résultat de certaines commandes dépendent de la taille du terminal."})
group.items.append({"id": "g4", "content": "Remplir plutôt son `.bashrc` que saturer sa mémoire."})
group.items.append({"id": "g5", "content": "Ne pas démarrer de terminal en mode `root`."})

group.items.append({"id": "b1", "content": "Penser à gratter les puces informatiques entre chaque reboot."})

random.shuffle(group.items)
==


text==
Sélectionnez les réflexes qui sauvent l'utilisateur dans un terminal unix...
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|


right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = item['id']
    if "g"in content:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==

