@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==#|python|
from random import randint

v0000 = randint(0, 1)
v0001 = randint(0, 1)
v0011 = randint(0, 1)
v0010 = randint(0, 1)

v0100 = randint(0, 1)
v0101 = randint(0, 1)
v0111 = randint(0, 1)
v0110 = randint(0, 1)

v1100 = randint(0, 1)
v1101 = randint(0, 1)
v1111 = randint(0, 1)
v1110 = randint(0, 1)

v1000 = randint(0, 1)
v1001 = randint(0, 1)
v1011 = randint(0, 1)
v1010 = randint(0, 1)


==

title=Une fonction Python pour un tableau.

text==
<style>
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
Écrire une fonction Python à quatre argument A, B, C, D dont les évaluations
avec les booléans True et False donneront le tableau de Karnaugh qui suit.
</td>
<td>&nbsp; &nbsp;</td>
<td>
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
    <td class="karnaugh">&nbsp; &nbsp; 0 &nbsp; &nbsp; </td>
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
</td>
</tr>
</table>
</center>
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, f"student code:\n{editor.code}")
==

