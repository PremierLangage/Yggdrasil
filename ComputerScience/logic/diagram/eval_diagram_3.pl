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

tag=logique|booléen|circuit|simple

group =: RadioGroup

size_diagram=3
complexity_diagram=4

before==#|python|
from utils_diagram import generate_random_diagram, diagram_to_string, eval_diagram, diagram_to_string_color
from components import GraphDrawer
from random import randint

size_diagram=int(size_diagram)
complexity_diagram=int(complexity_diagram)

diagram = generate_random_diagram(size_diagram, complexity_diagram)

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

title=Évaluation d'un petit circuit logique

text==#|markdown|
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
==

form==#|markdown|
Évaluer l'unique sortie <b>f</b> de ce circuit logique dont voici les valeurs des 
variables en entrées.<br>
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

evaluator==#|python|

form="""
Évaluer l'unique sortie <b>f</b> de ce circuit logique dont voici les valeurs des 
variables en entrées.<br>
{% for k,v in eval_point.items() %} <b>{{k}}</b> : <b>{{v}}</b>, {% endfor %}
<center>
<table>
<tr>
<td>
{{ viewer | component }}
</td>
</tr>
</table>
</center>
"""

S = group.selection
score=50

viewer.graph = graph_correction

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if item['content'] == str(final_value):
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite" style="padding: 1em;">Bonne r&eacute;ponse</span>'
        else:
            item['css'] = 'error-border'
            feedback = '<span class="error-state animated pulse infinite" style="padding: 1em;">Mauvaise r&eacute;ponse</span>'
    elif item['content'] == str(final_value):
        item['css'] = 'success-border animated pulse infinite'

feedback = '<center>' + feedback + '</center><br>'

grade = (score, feedback)
==

