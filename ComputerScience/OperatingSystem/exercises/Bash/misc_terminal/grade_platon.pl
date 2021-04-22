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

author=Nicolas Borie

title=les couches systèmes et logicielles dans PLaTon



# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "**Morceau de code** proposé en ligne par un élève" },
    { "id": "", "content": "**Code contextuel d'évaluation** de l'enseignant et mettant en scène le code élève" },
    { "id": "", "content": "Bibliothèque **subprocess** de Python (pour exécuter un programme dans un autre)" },
    { "id": "", "content": "Partie de **PLaTon** (écrit en Python) jouant un exercice" },
    { "id": "", "content": "**Containeur** Docker simulant un système sécurisé" },
    { "id": "", "content": "Application **Docker** manageant les containeurs" },
    { "id": "", "content": "**Système d'exploitation** du serveur du CRI" },
    { "id": "", "content": "**Matériel** : serveur du C.R.I. dans le sous-sol de Copernic" }
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
    e["id"] = str(uuid.uuid4())
    answer.append(e["id"])
random.shuffle(sortlist.items)
==


text==#|markdown|
Encore une fois, PLaTon n'est pas un système d'exploitation mais une application 
web. Mais c'est toutefois une application web qui résout
des problèmes relativement avancés et ces problèmes relèvent principalement du système 
(être multi-utilisateurs et résister à plein de boucles infinies...).

<br>

Tenter de replacer, dans l'ordre, toutes les couches "plus ou moins système" que
traverse le code d'un élève qui fait un exercice de programmation sous PLaTon.

<br>

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
    grade = (100, '''<center><span class="success-state animated pulse infinite" style="padding: 10px">Mais c'est bien sur !</span></center>''')
else:
    grade = (0, f'<center><span class="error-state animated pulse infinite" style="padding: 10px">{ errors } éléments mal positionés</span></center>')
==

