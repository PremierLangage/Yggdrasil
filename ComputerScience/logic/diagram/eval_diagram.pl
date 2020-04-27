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

@ utils_diagram.py

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before==#|python|
from utils_diagram import generate_random_diagram, diagram_to_string, eval_diagram
from components import GraphDrawer
from random import randint

size_diagram = 6

diagram = generate_random_diagram(size_diagram, 12)

viewer = GraphDrawer(graph = diagram_to_string(diagram))

input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]

eval_point = {}
for i in range(size_diagram):
    eval_point[input_names[i]] = randint(0,1)

final_value = eval_diagram(diagram, eval_point)
==

title=Évaluation d'un circuit logique

text==
<style>
 .graph-viewer-component {
 pointer-events: none;
}
.karnaugh{
 border: solid black 1px;
 padding: 3px;
}
.karnaugh td{
 text-align: center;
 font-weight: bold;
}
</style>

Évaluer l'unique sortie **f** de ce circuit logique dont voici les valeurs des 
variables en entrées :
{% for k,v in eval_point.items() %}
 k : v, 
{% endfor %}
<center>
{{ viewer | component }}
</center>
==

form==


<center>
{{ viewer | component }}
</center>
==

evaluator==#|python|

final_grade = 100

grade = (final_grade, "&nbsp;")
==

