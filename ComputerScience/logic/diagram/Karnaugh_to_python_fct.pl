@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.height = 120px
editor.code ==
def Karnaugh(A, B, C, D):
    # Votre code ici...
    return False
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

title=Une fonction Python pour un tableau de Karnaugh.

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
<td width="50%">
Écrire une fonction Python **Karnaugh** à quatre arguments **A**, **B**, 
**C** et **D**, dont les évaluations sur un quadruplets de booléans True 
et False donneront le tableau de Karnaugh qui suit (Naturellement 0 est 
faux et 1 est vrai).
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
    <td class="karnaugh">&nbsp; &nbsp; {{ v0000 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0001 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0011 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0010 }} &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 01 &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0100 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0101 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0111 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v0110 }} &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 11 &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1100 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1101 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1111 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1110 }} &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 10 &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1000 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1001 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1011 }} &nbsp; &nbsp; </td>
    <td class="karnaugh">&nbsp; &nbsp; {{ v1010 }} &nbsp; &nbsp; </td>
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

