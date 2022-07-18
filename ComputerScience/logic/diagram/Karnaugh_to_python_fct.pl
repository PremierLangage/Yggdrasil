@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

tag=logique|booléen|circuit|karnaugh|table de vérité|Python

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

nb_attempt = 0
best_grade = 0
==

title=Une fonction Python pour un tableau de Karnaugh.

text==#|markdown|
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

correction_display==#|markdown|
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
    <td class="karnaugh" style="background-color: {{color_back0000}};">
    &nbsp; &nbsp; <span style="color: {{color0000}}">{{ o0000 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0001}};">
    &nbsp; &nbsp; <span style="color: {{color0001}}">{{ o0001 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0011}};">
    &nbsp; &nbsp; <span style="color: {{color0011}}">{{ o0011 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0010}};">
    &nbsp; &nbsp; <span style="color: {{color0010}}">{{ o0010 }}
    </span> &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 01 &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0100}};">
    &nbsp; &nbsp; <span style="color: {{color0100}}">{{ o0100 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0101}};">
    &nbsp; &nbsp; <span style="color: {{color0101}}">{{ o0101 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0111}};">
    &nbsp; &nbsp; <span style="color: {{color0111}}">{{ o0111 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back0110}};">
    &nbsp; &nbsp; <span style="color: {{color0110}}">{{ o0110 }}
    </span> &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 11 &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1100}};">
    &nbsp; &nbsp; <span style="color: {{color1100}}">{{ o1100 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1101}};">
    &nbsp; &nbsp; <span style="color: {{color1101}}">{{ o1101 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1111}};">
    &nbsp; &nbsp; <span style="color: {{color1111}}">{{ o1111 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1110}};">
    &nbsp; &nbsp; <span style="color: {{color1110}}">{{ o1110 }}
    </span> &nbsp; &nbsp; </td>
  </tr>
  <tr>
    <td> &nbsp; 10 &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1000}};">
    &nbsp; &nbsp; <span style="color: {{color1000}}">{{ o1000 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1001}};">
    &nbsp; &nbsp; <span style="color: {{color1001}}">{{ o1001 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1011}};">
    &nbsp; &nbsp; <span style="color: {{color1011}}">{{ o1011 }}
    </span> &nbsp; &nbsp; </td>
    <td class="karnaugh" style="background-color: {{color_back1010}};">
    &nbsp; &nbsp; <span style="color: {{color1010}}">{{ o1010 }}
    </span> &nbsp; &nbsp; </td>
  </tr>
</table>

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
<br />
<center>
<b>Note pour cette tentative {{ final_grade }} / 100</b>
</center>

==


evaluator==#|python|
nb_goods = 0
# Beurk, this will load the student function...
try:
    exec(editor.code)
    code_python = True
except:
    Karnaugh = lambda x,y,z,t: False
    code_python = False

nb_attempt += 1

# fisrt line checks
o0000 = int(Karnaugh(0,0,0,0))
if o0000 == v0000:
    nb_goods += 1
    color_back0000 = "lightgreen"
    color0000 = "green"
else:
    color_back0000 = "#f8d7da"
    color0000 = "red"

o0001 = int(Karnaugh(0,1,0,0))
if o0001 == v0001:
    nb_goods += 1
    color_back0001 = "lightgreen"
    color0001 = "green"
else:
    color_back0001 = "#f8d7da"
    color0001 = "red"

o0011 = int(Karnaugh(1,1,0,0))
if o0011 == v0011:
    nb_goods += 1
    color_back0011 = "lightgreen"
    color0011 = "green"
else:
    color_back0011 = "#f8d7da"
    color0011 = "red"

o0010 = int(Karnaugh(1,0,0,0))
if o0010 == v0010:
    nb_goods += 1
    color_back0010 = "lightgreen"
    color0010 = "green"
else:
    color_back0010 = "#f8d7da"
    color0010 = "red"

# second line checks
o0100 = int(Karnaugh(0,0,0,1))
if o0100 == v0100:
    nb_goods += 1
    color_back0100 = "lightgreen"
    color0100 = "green"
else:
    color_back0100 = "#f8d7da"
    color0100 = "red"

o0101 = int(Karnaugh(0,1,0,1))
if o0101 == v0101:
    nb_goods += 1
    color_back0101 = "lightgreen"
    color0101 = "green"
else:
    color_back0101 = "#f8d7da"
    color0101 = "red"

o0111 = int(Karnaugh(1,1,0,1))
if o0111 == v0111:
    nb_goods += 1
    color_back0111 = "lightgreen"
    color0111 = "green"
else:
    color_back0111 = "#f8d7da"
    color0111 = "red"

o0110 = int(Karnaugh(1,0,0,1))
if o0110 == v0110:
    nb_goods += 1
    color_back0110 = "lightgreen"
    color0110 = "green"
else:
    color_back0110 = "#f8d7da"
    color0110 = "red"

# third line checks
o1100 = int(Karnaugh(0,0,1,1))
if o1100 == v1100:
    nb_goods += 1
    color_back1100 = "lightgreen"
    color1100 = "green"
else:
    color_back1100 = "#f8d7da"
    color1100 = "red"

o1101 = int(Karnaugh(0,1,1,1))
if o1101 == v1101:
    nb_goods += 1
    color_back1101 = "lightgreen"
    color1101 = "green"
else:
    color_back1101 = "#f8d7da"
    color1101 = "red"

o1111 = int(Karnaugh(1,1,1,1))
if o1111 == v1111:
    nb_goods += 1
    color_back1111 = "lightgreen"
    color1111 = "green"
else:
    color_back1111 = "#f8d7da"
    color1111 = "red"

o1110 = int(Karnaugh(1,0,1,1))
if o1110 == v1110:
    nb_goods += 1
    color_back1110 = "lightgreen"
    color1110 = "green"
else:
    color_back1110 = "#f8d7da"
    color1110 = "red"

# foorth line checks
o1000 = int(Karnaugh(0,0,1,0))
if Karnaugh(False, False, True, False) == v1000:
    nb_goods += 1
    color_back1000 = "lightgreen"
    color1000 = "green"
else:
    color_back1000 = "#f8d7da"
    color1000 = "red"

o1001 = int(Karnaugh(0,1,1,0))
if Karnaugh(False, True, True, False) == v1001:
    nb_goods += 1
    color_back1001 = "lightgreen"
    color1001 = "green"
else:
    color_back1001 = "#f8d7da"
    color1001 = "red"

o1011 = int(Karnaugh(1,1,1,0))
if Karnaugh(True, True, True, False) == v1011:
    nb_goods += 1
    color_back1011 = "lightgreen"
    color1011 = "green"
else:
    color_back1011 = "#f8d7da"
    color1011 = "red"

o1010 = int(Karnaugh(1,0,1,0))
if Karnaugh(True, False, True, False) == v1010:
    nb_goods += 1
    color_back1010 = "lightgreen"
    color1010 = "green"
else:
    color_back1010 = "#f8d7da"
    color1010 = "red"

comemnt_code = ""
if not code_python:
    nb_goods = 0
    comemnt_code = """<span style="font-size: 1em; color: darkred;"><b>Il y a une erreur dans votre fonction Python, l'interprêteur Python refuse sa définition !</b><br><br>"""

note_eff = 50 + (200 // (3+nb_attempt))
final_grade = (max(0, int((100*(nb_goods-8))/8) ) * note_eff) // 100

tent_rmrq = str(nb_attempt) + " Tentative"
if nb_attempt > 1:
    tent_rmrq = str(nb_attempt) + " Tentatives"

note_finale = final_grade
best_grade = max([note_finale, best_grade])

feedback_note = "<br><u>Note finale :</u> <b>"+str(best_grade)+"%</b> <i>(Toutes propositions confondues)</i><br>"
feedback_note += "Votre fonction respectent "+str(nb_goods)+" / 16 cases du tableau de Karnaugh. <br>"
feedback_note += "Partie tests : "+str(max(0, int((100*(nb_goods-8))/8) ))+"% <br>"
feedback_note += "Partie efficacité : "+str(note_eff)+"% ("+tent_rmrq+")<br><br>"

text=comemnt_code+correction_display+feedback_note

grade = (final_grade, "&nbsp;")

==

