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
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=les couches dans PLaTon

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "Code proposé en ligne par un élève logué sur PLaTon" },
    { "id": "", "content": "Script Python d'évaluation de l'enseignant" },
    { "id": "", "content": "Bibliothèque subprocess de Python (pour exécuter un script dans un programme)" },
    { "id": "", "content": "Programme PLaTon (écrit en Python) jouant un exercice" },
    { "id": "", "content": "Containeur Docker simulant un système sécurisé" },
    { "id": "", "content": "Application Docker manageant les containeurs" },
    { "id": "", "content": "Système d'exploitation du serveur du CRI" },
    { "id": "", "content": "Serveur du C.R.I. dans le sous-sol de Copernic" }
]
==

# RANDOMIZATION
before== #|python|
import random
import uuid
answer = []
for e in sortlist.items:
    # generate random id because students can
    # guest the answer if ids like 1, 2, 3 are used
    e["id"] = uuid.uuid4()
    answer.append(e["id"])
random.shuffle(sortlist.items)
==


text==#|markdown|
Tenter de replacer, dans l'ordre, toutes les couches "plus ou moins système" que
traverse le code d'un élève qui fait un exercice de programmation sous PLaTon.

Placer en haut la réponse de l'étudiant et en bas le matériel qui devra exécuter 
potentiellement cette réponse.
==

form==#|markdown|
{{ sortlist|component }}
==

# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '''<span class="success-state animated pulse infinite" style="padding: 10px">Mais c'est bien sûr!</span>''')
else:
    grade = (0, f'<span class="error-state animated pulse infinite" style="padding: 10px">{ errors } éléments mal positionés</span>')
==

