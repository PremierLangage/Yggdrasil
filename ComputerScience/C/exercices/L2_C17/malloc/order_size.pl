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
title = Taille de quelques variables

author = Nicolas Borie

tag=C|variable|mémoire|sizeof

text==#|markdown|

Classer les variables suivantes de la plus petite en mémoire à la plus grosse. la
machine est un ordinateur standard exécutant un système d'exploitation 64 bits.

==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[
    { "id": "1", "content": "<b>char c;</b>" },
    { "id": "2", "content": "<b>char s[3];</b>" },
    { "id": "3", "content": "<b>short tee[2];</b>" },
    { "id": "4", "content": "<b>char short_name[7];</b>" },
    { "id": "5", "content": "<b>char* name;</b>" },
    { "id": "6", "content": "<b>float cos_sin_tan[3];</b>" },
    { "id": "7", "content": "<b>double d[2];</b>" },
    { "id": "8", "content": "<b>int tab[5];</b>" }
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
    grade = (100, '<span class="success-state">Bravo, elles sont bien classées en taille croissante !</span>.')
else:
    grade = (0, '<span class="error-state">%s variables sont mal positionées.</span>' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==





