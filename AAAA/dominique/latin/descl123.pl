
title= Exos de latin  desclinaisons 1,2,3

text=

@ mots.csv
@ gendec.py
before==

from gendec import question

text, sol = question()
texti=text
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
nbq += 1
ok = (sol == inputbox.value)
if ok:
    nbbr += 1 
    feedback = f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>'
    grade = (100," ")
else:
    feedback = f'<span class="error-state">Bad answer</span> <br/><span >{texti}<br> la bonne réponse  était : {sol}  {nbbr}/{nbq} </span>'
    grade = (0, " ")


from gendec import question

texti, sol = question()
text = texti + "<br><br><br>Question précédente : <br>"+feedback
==


