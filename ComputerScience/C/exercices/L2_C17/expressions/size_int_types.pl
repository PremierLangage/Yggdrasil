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

# FORM
title = Tailles de quelques types entiers
author = Nicolas Borie

tag=C|type|sizeof|int

text==#|markdown|
Classez les types entiers suivant du plus petit (en haut) en mémoire au plus grand (en bas).
==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[
    { "id": "1", "content": "<b>signed char</b>" },
    { "id": "2", "content": "<b>short</b>" },
    { "id": "3", "content": "<b>unsigned int</b>" },
    { "id": "4", "content": "<b>long int</b>" }
]
==

# RANDOMIZATION
before== #|python|
import random
answer = []
for e in sortlist.items:
    answer.append(e["id"])
random.shuffle(sortlist.items)

note=None
==

# EVALUATION
evaluator== #|python|
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


errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state anim-fade'
    if e['id'] != answer[i]:
        e['css'] = 'error-state anim-fade'
        errors += 1

if note is None:
    note = 25*(4 - errors)

feedback = "Note finale : "+str(note)+" / 100<br><br>"

if errors == 0:
    grade = (note, feedback+'<span class="success-state">Bravo, les types sont bien class&eacute;s.</span>.')
else:
    grade = (note, feedback+'<span class="error-state">%s types sont mal position&eacute;s.</span>' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==






