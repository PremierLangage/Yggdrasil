
title= Exos de latin  desclinaisons 1,2,3

text=

@ mots.csv
@ gendec.py
before==

from gendec import question

text, sol = question()

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




form==
{{ inputbox|component}}
==

evaluator==
nbq=0

if sol == inputbox.value:
    nbbr += 1 
    grade = (100, '<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
else:
    grade = (0, f'<span class="error-state">Bad answer <br>{text} la bonne réponse  était : {sol}</span> <span > {nbbr}/{nbq} </span>')


from gendec import question

text, sol = question()
==


