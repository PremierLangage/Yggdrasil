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

tag=logique|booléen|circuit|karnaugh|table de vérité

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
votre temps, utilisez un stylo et du papier avant de remplir votre 
proposition car une seulement une tentative sera autorisée.
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

correction_feedback==#|markdown|
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
    <td class="karnaugh" style="background-color: light{{color_00}}"> &nbsp; &nbsp; 
    <span style="color: {{color_00}}">{{ k_table[0][0] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_01}}"> &nbsp; &nbsp; 
    <span style="color: {{color_01}}">{{ k_table[0][1] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_02}}"> &nbsp; &nbsp; 
    <span style="color: {{color_02}}">{{ k_table[0][2] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_03}}"> &nbsp; &nbsp; 
    <span style="color: {{color_03}}">{{ k_table[0][3] }}</span> &nbsp; &nbsp; 
    </td>
  </tr>
  <tr>
    <td> &nbsp; 01 &nbsp; </td>
    <td class="karnaugh" style="background-color: light{{color_10}}"> &nbsp; &nbsp; 
    <span style="color: {{color_10}}">{{ k_table[1][0] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_11}}"> &nbsp; &nbsp; 
    <span style="color: {{color_11}}">{{ k_table[1][1] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_12}}"> &nbsp; &nbsp; 
    <span style="color: {{color_12}}">{{ k_table[1][2] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_13}}"> &nbsp; &nbsp; 
    <span style="color: {{color_13}}">{{ k_table[1][3] }}</span> &nbsp; &nbsp; 
    </td>
  </tr>
  <tr>
    <td> &nbsp; 11 &nbsp; </td>
    <td class="karnaugh" style="background-color: light{{color_20}}"> &nbsp; &nbsp; 
    <span style="color: {{color_20}}">{{ k_table[2][0] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_21}}"> &nbsp; &nbsp; 
    <span style="color: {{color_21}}">{{ k_table[2][1] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_22}}"> &nbsp; &nbsp; 
    <span style="color: {{color_22}}">{{ k_table[2][2] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_23}}"> &nbsp; &nbsp; 
    <span style="color: {{color_23}}">{{ k_table[2][3] }}</span> &nbsp; &nbsp; 
    </td>
  </tr>
  <tr>
    <td> &nbsp; 10 &nbsp; </td>
    <td class="karnaugh" style="background-color: light{{color_30}}"> &nbsp; &nbsp; 
    <span style="color: {{color_30}}">{{ k_table[3][0] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_31}}"> &nbsp; &nbsp; 
    <span style="color: {{color_31}}">{{ k_table[3][1] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_32}}"> &nbsp; &nbsp; 
    <span style="color: {{color_32}}">{{ k_table[3][2] }}</span> &nbsp; &nbsp; 
    </td>
    <td class="karnaugh" style="background-color: light{{color_33}}"> &nbsp; &nbsp; 
    <span style="color: {{color_33}}">{{ k_table[3][3] }}</span> &nbsp; &nbsp; 
    </td>
  </tr>
</table>
</td>
<td>
&nbsp; &nbsp;
</td>
<td>
<u><b>Note finale:</b></u> {{ final_grade }} / 100 <br />
{% if final_grade == 100 %}
  Mais quel talent !
{% endif %}
</td>
</tr>
</table>
</center>
==

evaluator==#|python|
nb_goods = 0

# first line of karnaugh table
if (int(response['0000']) == k_table[0][0]):
    nb_goods += 1
    color_00 = "green"
else:
    color_00 = "red"
if (int(response['0001']) == k_table[0][1]):
    nb_goods += 1
    color_01 = "green"
else:
    color_01 = "red"
if (int(response['0011']) == k_table[0][2]):
    nb_goods += 1
    color_02 = "green"
else:
    color_02 = "red"
if (int(response['0010']) == k_table[0][3]):
    nb_goods += 1
    color_03 = "green"
else:
    color_03 = "red"

# second line of karnaugh table
if (int(response['0100']) == k_table[1][0]):
    nb_goods += 1
    color_10 = "green"
else:
    color_10 = "red"
if (int(response['0101']) == k_table[1][1]):
    nb_goods += 1
    color_11 = "green"
else:
    color_11 = "red"
if (int(response['0111']) == k_table[1][2]):
    nb_goods += 1
    color_12 = "green"
else:
    color_12 = "red"
if (int(response['0110']) == k_table[1][3]):
    nb_goods += 1
    color_13 = "green"
else:
    color_13 = "red"

# third line of karnaugh table
if (int(response['1100']) == k_table[2][0]):
    nb_goods += 1
    color_20 = "green"
else:
    color_20 = "red"
if (int(response['1101']) == k_table[2][1]):
    nb_goods += 1
    color_21 = "green"
else:
    color_21 = "red"
if (int(response['1111']) == k_table[2][2]):
    nb_goods += 1
    color_22 = "green"
else:
    color_22 = "red"
if (int(response['1110']) == k_table[2][3]):
    nb_goods += 1
    color_23 = "green"
else:
    color_23 = "red"

# foorth line of karnaugh table
if (int(response['1000']) == k_table[3][0]):
    nb_goods += 1
    color_30 = "green"
else:
    color_30 = "red"
if (int(response['1001']) == k_table[3][1]):
    nb_goods += 1
    color_31 = "green"
else:
    color_31 = "red"
if (int(response['1011']) == k_table[3][2]):
    nb_goods += 1
    color_32 = "green"
else:
    color_32 = "red"
if (int(response['1010']) == k_table[3][3]):
    nb_goods += 1
    color_33 = "green"
else:
    color_33 = "red"

text = correction_feedback

final_grade = max(0, int((100*(nb_goods-8))/8) )

form="""
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
<tr>
  <td>
    {{ viewer | component }}
  </td>
</tr>
</table>
"""

evaluator='grade = (final_grade, "&nbsp;")'

grade = (final_grade, "&nbsp;")
==





