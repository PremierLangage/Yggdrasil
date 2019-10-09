@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Tailles de quelques types entiers
author = Nicolas Borie

text== 
Mettre en ordre les types entiers suivant du plus petit en mémoire au plus grand.
==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[
    { "id": "1", "content": "<b>signed char</b>" },
    { "id": "2", "content": "<b>short</b>" },
    { "id": "3", "content": "<b>unsigned int</b>" },
    { "id": "4", "content": "<b>long int</b>" },
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
    grade = (100, '<span class="success-state">Bravo, les types sont bien classés.</span>.')
else:
    grade = (0, '<span class="error-state">%s types sont mal positionés.</span>' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==



