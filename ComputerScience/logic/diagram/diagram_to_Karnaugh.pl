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
Remplir le tableau de Karnaugh associé au circuit logique suivant :
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
<table>
<tr><td>
{{ viewer | component }}
</td><td>&nbsp;&nbsp;&nbsp;</td><td>
<table class="karnaugh">
  <tr>
    <td></td><td></td><td colspan="4"> &nbsp; AB &nbsp; </td>
  <tr>
  <tr>
    <td></td><td></td><td>00</td><td>01</td><td>11</td><td>10</td>
  </tr>
  <tr>
    <td rowspan="4" style="vertical-align: middle;"> &nbsp; CD &nbsp; </td>
    <td> &nbsp; 00 &nbsp; </td>
    <td class="karnaugh"><input id="form_0000" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0001" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0011" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0010" type="text" value="0" size="1"/></td>
  </tr>
  <tr>
    <td> &nbsp; 01 &nbsp; </td>
    <td class="karnaugh"><input id="form_0100" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0101" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0111" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0110" type="text" value="0" size="1"/></td>
  </tr>
  <tr>
    <td> &nbsp; 11 &nbsp; </td>
    <td class="karnaugh"><input id="form_1100" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1101" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1111" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1110" type="text" value="0" size="1"/></td>
  </tr>
  <tr>
    <td> &nbsp; 10 &nbsp; </td>
    <td class="karnaugh"><input id="form_1000" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1001" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1011" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_1010" type="text" value="0" size="1"/></td>
  </tr>
</table>

</td></tr></table>
==

correction_feedback==
<center>
<table><tr><td>
<table class="karnaugh">
  <tr>
    <td></td><td></td><td colspan="4"> &nbsp; AB &nbsp; </td>
  <tr>
  <tr>
    <td></td><td></td><td>00</td><td>01</td><td>11</td><td>10</td>
  </tr>
  <tr>
    <td rowspan="4" style="vertical-align: middle;"> &nbsp; CD &nbsp; </td>
    <td> &nbsp; 00 &nbsp; </td>
    <td class="karnaugh"> &nbsp; &nbsp; {{ k_table[0][0] }} &nbsp; &nbsp; </td>
    <td class="karnaugh"> &nbsp; &nbsp; {{ k_table[0][1] }} &nbsp; &nbsp; </td>
    <td class="karnaugh"> &nbsp; &nbsp; {{ k_table[0][2] }} &nbsp; &nbsp; </td>
    <td class="karnaugh"> &nbsp; &nbsp; {{ k_table[0][3] }} &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 01 &nbsp; </td>
    <td class="karnaugh"> &nbsp;&nbsp; {{ k_table[1][0] }} &nbsp;&nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[1][1] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[1][2] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[1][3] }} &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 11 &nbsp; </td>
    <td class="karnaugh"> &nbsp;&nbsp; {{ k_table[2][0] }} &nbsp;&nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[2][1] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[2][2] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[2][3] }} &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 10 &nbsp; </td>
    <td class="karnaugh"> &nbsp;&nbsp; {{ k_table[3][0] }} &nbsp;&nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[3][1] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[3][2] }} &nbsp; </td>
    <td class="karnaugh"> &nbsp; {{ k_table[3][3] }} &nbsp; </td>
  </tr>
</table>
</td>
<td>
&nbsp; &nbsp;
</td>
<td>
<u><b>Note finale:</b></u> 100
</td>
</tr>
</table>
</center>
==

evaluator==

text = correction_feedback

grade = (100, "&nbsp;")
==





