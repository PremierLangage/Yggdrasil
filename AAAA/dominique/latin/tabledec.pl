
title= table
text==
|  cas     | Singulier | Pluriel |
|----------|----------|----------|
|nominatif|{{ inputbox|component}}|{{ inputbox|component}}|
|vocatif|{{ inputbox|component}}|{{ inputbox|component}}|
|accusatif|{{ inputbox|component}}|{{ inputbox|component}}|
|génitif|{{ inputbox|component}}|{{ inputbox|component}}|
|datif|{{ inputbox|component}}|{{ inputbox|component}}|
|ablatif|{{ inputbox|component}}|{{ inputbox|component}}|
==

form==
|  cas     | Singulier | Pluriel |
|----------|----------|----------|
|nominatif|{{ inputbox|component}}|{{ inputbox|component}}|
|vocatif|{{ inputbox|component}}|{{ inputbox|component}}|
|accusatif|{{ inputbox|component}}|{{ inputbox|component}}|
|génitif|{{ inputbox|component}}|{{ inputbox|component}}|
|datif|{{ inputbox|component}}|{{ inputbox|component}}|
|ablatif|{{ inputbox|component}}|{{ inputbox|component}}|

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


 