
title= Exos de latin  desclinaisons 1,2,3

text=

@ mots.csv
@ gendec.py
before==

from gendec import question

text, sol = question()

nbq=0
nbbr=0

# Nombre de tentatives
borneq=3
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

if sol == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {sol}  {nbbr}/{nbq} </span>')


if nbq <= borneq:
 # réinitialisation des alea mais aussi des définitions , un impact sur l'exécution ?
 from gendec import question

 text, sol = question()
else:
  if nbbr == nbq :
    grade = (100, f'<span class="success-state">BRAVO!tout est bon 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
  else:
    grade = (0, f'<span class="error-state">Quelques bonnes réponses tout de même? =</span> <br/><span >{nbbr}/{nbq} </span>')
  exit
==


