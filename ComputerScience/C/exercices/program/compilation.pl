@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Étape durant la compilation avec **gcc**

text== 
Remettre en ordre toutes les étapes transformant les sources d'un programme C 
en un éxécutable fonctionnel à l'aide du compilateur **gcc**.
==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[
    { "id": "1", "content": "Préprocession" },
    { "id": "2", "content": "Analyse lexicale" },
    { "id": "3", "content": "Analyse syntaxique" },
    { "id": "4", "content": "Analyse sémantique" },
    { "id": "5", "content": "Génération de code intermédiaire" },
    { "id": "6", "content": "Optimisation de code" },
    { "id": "7", "content": "Génération de code machine" },
    { "id": "8", "content": "Édition de liens" }
]
==

# RANDOMIZATION
before== #|python|
import random
answer = []
for e in sortlist.items:
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state anim-fade'
    if e['id'] != answer[i]:
        e['css'] = 'error-state anim-fade'
        errors += 1

if errors == 0:
    grade = (100, 'Bravo, il se passe effectivement tout cela lors d\'une passe complête de **gcc**.')
else:
    grade = (0, '%s étapes sont mal positionées.' % errors)
==

