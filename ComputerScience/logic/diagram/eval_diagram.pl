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
from utils_diagram import generate_random_diagram, diagram_to_string, karnaugh_table
from components import GraphDrawer

diagram = generate_random_diagram(4, 5)

viewer = GraphDrawer(graph = diagram_to_string(diagram))

k_table = karnaugh_table(diagram)
==

title=Table de vérité d'un circuit logique

text==
Remplir le tableau de Karnaugh associé au circuit logique suivant. Prenez 
votre temps et utilisez un stylo et du papier avant de remplir votre 
proposition.
==

form==
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

<center>
{{ viewer | component }}
</center>
==

evaluator==#|python|

final_grade = 100

grade = (final_grade, "&nbsp;")
==

