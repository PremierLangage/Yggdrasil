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

nb_task = randint(12,20)    # random task number
nb_core = randint(3, 6)     # random number of cores
nb_max_by_core = 10
drag_list = []
list_duration_task = []
for i in range(nb_task):
    drag = DragDrop(
        id=f"drag{i}",
        content = randint(1, 15)
    )
    list_duration_task.append(int(drag.content))
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

# insert task by task inside a ready core.... This is the solution
def compute_full_duration(nb_cores, list_task):
    duration_core = [0]*nb_cores
    for duration in list_task:
        min_index = 0
        for i in range(nb_cores):
            if duration_core[i] < duration_core[min_index]:
                min_index = i
        duration_core[min_index] += duration
    return max(duration_core)

soluce = compute_full_duration(nb_core, list_duration_task)

==

title=Ordonner des process en FIFO sur une machine multicoeur
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
        Core {{ loop.index0 }} :
        {% for e in l %}
            {{ e|component }}
        {% endfor %}
        <hr color="black">
    {% endfor %}

Temps de travail total : {{ inputbox|component }}

==

evaluator==#|python|
form = """
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

if soluce == inputbox.value:
    grade = (100, ''' <span class="success-state">Bravo, c'est exactement cela : '''+str(soluce)+' unités de temps </span>')
else:
    grade = (0, ''' <span class="error-state">Désolé, vous avez fait une erreur, la réponse attendue était : '''+str(soluce)+' unités de temps</span>')
==



