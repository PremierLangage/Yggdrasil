# UN EXEMPLE CODÉ EN 10 MINUTES...

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Phases de la mitose
author = Nicolas Borie

text== 
Mettre en ordre les phases de la mitose.
==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[

    { "id": "1", "content": "<b>Prophase</b>" },
    { "id": "2", "content": "<b>Métaphase</b>" },
    { "id": "3", "content": "<b>Anaphase</b>" },
    { "id": "4", "content": "<b>Télophase</b>" }
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
    grade = (100, '<span class="success-state">Bravo, il se passe effectivement tout cela lors d\'une mitose</span>.')
else:
    grade = (0, '<span class="error-state">%s étapes sont mal positionées.</span>' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==

