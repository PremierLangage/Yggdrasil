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

tag=logique|booléen|circuit|difficile

group =: RadioGroup

before==#|python|
from utils_diagram import generate_random_diagram, diagram_to_string, eval_diagram, diagram_to_string_color
from components import GraphDrawer
from random import randint

size_diagram = 6

diagram = generate_random_diagram(size_diagram, 10)

viewer = GraphDrawer(graph = diagram_to_string(diagram))

input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]

eval_point = {}
for i in range(size_diagram):
    eval_point[input_names[i]] = True if randint(0,1) else False

final_value = True if eval_diagram(diagram, eval_point) else False

graph_correction = diagram_to_string_color(diagram, eval_point)

group.items = []
group.items.append({
    "id": "true",
    "content": str(True)
})
group.items.append({
    "id": "false",
    "content": str(False)
})
==

title=Évaluation d'un énorme circuit logique

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
variables en entrées.   
{% for k,v in eval_point.items() %} <b>{{k}}</b> : <b>{{v}}</b>, {% endfor %}
<center>
<table>
<tr>
<td>
{{ group|component }}
</td>
<td>
&nbsp; &nbsp;
</td>
<td>
{{ viewer | component }}
</td>
</tr>
</table>
</center>
==

form==

==

evaluator==#|python|
S = group.selection
score=50

viewer.graph = graph_correction

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if item['content'] == str(final_value):
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite">Bonne réponse</span>'
        else:
            item['css'] = 'error-border'
            feedback = '<span class="error-state animated pulse infinite">Mauvaise réponse</span>'
    elif item['content'] == str(final_value):
        item['css'] = 'success-border animated pulse infinite'

feedback = '<center>' + feedback + '</center>'

grade = (score, feedback)
==



