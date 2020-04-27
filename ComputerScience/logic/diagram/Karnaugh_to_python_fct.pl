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
**C** et **D**, dont les évaluations sur les quadruplets de booléans True 
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

evaluator==#|python|
nb_goods = 0
# Beurk, this will load the student function...
exec(editor.code)


# fisrt line checks
if Karnaugh(False, False, False, False) == v0000:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(False, True, False, False) == v0001:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, True, False, False) == v0011:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, False, False, False) == v0010:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"

# second line checks
if Karnaugh(False, False, False, True) == v0100:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(False, True, False, True) == v0101:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, True, False, True) == v0111:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, False, False, True) == v0110:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"

# third line checks
if Karnaugh(False, False, True, True) == v1100:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(False, True, True, True) == v1101:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, True, True, True) == v1111:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, False, True, True) == v1110:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"

# foorth line checks
if Karnaugh(False, False, True, False) == v1000:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(False, True, True, False) == v1001:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, True, True, False) == v1011:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"
if Karnaugh(True, False, True, False) == v1010:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"



final_grade = max(0, int((100*(nb_goods-8))/8) )

form=" "

grade = (final_grade, "&nbsp;")






==

