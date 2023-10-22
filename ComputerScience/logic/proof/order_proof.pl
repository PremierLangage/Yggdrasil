#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

url_img_triangle =$ /ComputerScience/logic/proof/img/triangle.png

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "First Item" },
    { "id": "", "content": "Second Item" },
    { "id": "", "content": "Third Item" }
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

author=Nicolas Borie

title=Réordonner une preuve

text==#|markdown|
Soit ABC un triangle tel que l'angle

{{ url_img_triangle }}
==

form={{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==



