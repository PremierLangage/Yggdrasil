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

inputbox =: Input
inputbox.type = number
inputbox.placeholder = 
inputbox.appearance = outline
inputbox.width = 20%


before== #|python|
from random import randint

nb_task = randint(15,24)    # random task number
nb_core = randint(2, 6)     # random number of cores
nb_max_by_core = 10
drag_list = []
for i in range(nb_task):
    drag = DragDrop(
        id=f"drag{i}",
        content = randint(1, 15)
    )
    drag_list.append(drag)
    globals()[drag.id] = drag

drop_list = []
for i in range(nb_core):
    drop_core = []
    for j in range(nb_max_by_core):
        drop = DragDrop(
        id=f"drop{i*nb_max_by_core+j}",
        droppable=True
        )
        drop_core.append(drop)
        globals()[drop.id] = drop
    drop_list.append(drop_core)
        

==

title=Ordonner des process en FIFO sur du multicoeurs
author=Nicolas Borie

text==
On dispose d'une machine avec **{{ nb_core }} coeurs** de calcul. La machine 
va devoir exécuter une **suite ordonnée de tâches** dont voici la liste. Proposez 
un ordonnancement correcte des tâches et donner ainsi un temps total de 
calcul pour traiter l'intégralité des **{{ nb_task }} tâches**.
==

form==
    {% for e in drag_list %}
        {{ e|component }}
    {% endfor %}

<hr color="black">

    {% for l in drop_list %}
        Core {{ loop.index0 }}
        {% for e in l %}
            {{ e|component }}
        {% endfor %}
        <hr color="black">
    {% endfor %}

Temps de travail total:{{ inputbox|component }}

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


