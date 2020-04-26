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
from utils_diagram import generate_random_diagram, diagram_to_string
from components import GraphDrawer

diagram = generate_random_diagram(4, 5)

viewer = GraphDrawer(graph = diagram_to_string(diagram))
==

title=Table de vérité d'un circuit logique

text==
Remplir le tableau de Karnaugh associé au circuit logique suivant :
==

form==
<style>
 .graph-viewer-component {
 pointer-events: none;
 transform: scale(0.75, 0.75);
}
</style>

<center>
<table>
<tr><td>
{{ viewer | component }}
</td><td>&nbsp;&nbsp;&nbsp;</td><td>
<table style="border: solid black 1px; padding:2px;">
  <tr>
    <td></td><td>00</td><td>01</td><td>11</td><td>10</td>
  </tr>
  <tr>
    <td>00</td><td></td><td></td><td></td><td></td>
  </tr>
  <tr>
    <td>01</td><td></td><td></td><td></td><td></td>
  </tr>
  <tr>
    <td>11</td><td></td><td></td><td></td><td></td>
  </tr>
  <tr>
    <td>10</td><td></td><td></td><td></td><td></td>
  </tr>
</table>

</td></tr></table>
==

evaluator==
grade = (100, "")
==




