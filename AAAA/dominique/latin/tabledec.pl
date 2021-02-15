
title= table
text==

==

inputbox1 =: Input
inputbox2 =: Input
inputbox3 =: Input
inputbox4 =: Input
inputbox5 =: Input
inputbox6 =: Input
inputbox7 =: Input
inputbox8 =: Input
inputbox9 =: Input
inputbox10 =: Input
inputbox11 =: Input
inputbox12 =: Input



form==
<table>
<th>cas</th><th>Singulier</th><th>Pluriel</th>
<tr><td>nominatif</td><td>{{ inputbox1|component}}</td><td>{{ inputbox7|component}}</td></tr>
<tr><td>vocatif</td><td>{{ inputbox2|component}}</td><td>{{ inputbox8|component}}</td></tr>
<tr><td>accusatif</td><td>{{ inputbox3component}}</td><td>{{ inputbox9|component}}</td></tr>
<tr><td>génitif</td><td>{{ inputbox4|component}}</td><td>{{ inputbox10|component}}</td></tr>
<tr><td>datif</td><td>{{ inputbox5|component}}</td><td>{{ inputbox11|component}}</td></tr>
<tr><td>ablatif</td><td>{{ inputbox6|component}}</td><td>{{ inputbox12|component}}</td></tr>
</table>
==

title= Exos de latin  desclinaisons 1,2,3

text=

@ mots.csv
@ gendec.py
before==

from gendec import question

textx, solx = question()

nbq=0
nbbr=0

==


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.appearance = outline



evaluator==
nbq += 1

if sol == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {sol}  {nbbr}/{nbq} </span>')


from gendec import question

text, sol = question()
==


 