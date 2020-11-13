#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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


before== #|python|
from random import randint

nb_task = randint(15,25)    # random task number
nb_core = randint(2, 6)     # random number of cores

drag_list = []
for i in range(nb_task):
    drag = DragDrop(
        id=f"drag{i}",
        content = randint(1, 15)
    )
    drag_list.append(drag)



sets = [
    ("1", drag1.cid, "{1, 2, 3}"),
    ("{1}", drag2.cid, "{ {1}, 2, 3}"),
    ("{1, 1}", drag2.cid, "{ {1, 2}, 3}"),
    ("3", drag1.cid, "{1, 2, 3}"),
]

drops = []
for i in range(len(sets)):
    drop = DragDrop(
        id=f"drop{i}",
        droppable=True
    )
    drops.append(drop)

    # add the component to the global context
    # so it can be synced by the framework
    globals()[drop.id] = drop
==

title==
Drag Drop
==

text==
==

form==
    {% for e in drag_list %}
        {{ e[0] }}
        {{ drops[loop.index0]|component }}
        {{ e[2] }}
    {% endfor %}


{{ drag1|component }}
{{ drag2|component }}
<br/>

<ul>
    {% for e in sets %}
    <li>
        {{ e[0] }}
        {{ drops[loop.index0]|component }}
        {{ e[2] }}
    </li>
    {% endfor %}
</ul>
==

evaluator==
errors = 0
for i, e in enumerate(sets):
    drop = globals()[f'drop{i}']
    drop.css = 'success-state animated rotateIn'
    if drop.droppedId != e[1]:
        drop.css = 'error-state animated pulse infinite'
        errors += 1

n = len(sets)
if errors == 0:
    grade = (100, f'<span class="success-state animated pulse infinite">{n}/{n}</span>')
else:
    grade = (100, f'<span class="error-state animated pulse infinite">{n - errors}/{n}</span>')
==


