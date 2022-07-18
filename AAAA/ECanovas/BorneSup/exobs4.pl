

# pour avoir du Latex dans le builder et le grader
extends = /model/basic.pl
# nombre de tentatives
settings.maxattempt % 1

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

extends = /gift/templates/qtruefalse.pl

title==
 Majorants
==

@ bornesup.csv
@ genQuest.py

before ==#|python|
import random as rd
from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(4,uneLigne)

#expected F or T
answer=bReponse

feedback_wrong="<div class='error-state'><h1>Mauvaise réponse</h1>Non la réponse était "
if bReponse=="F":
  feedback_wrong += " vrai (<i class='fas fa-times'></i>)"
else:
  feedback_wrong += " non (<i class='fas fa-check'></i>)"
feedback_wrong += "</div>"

def Convert(string): 
    li = list(string.split(",")) 
    return li 
bVal=list(bReponse['bonnes'].split(","))
aVal=list(bReponse['autres'].split(","))
checkbox.setdata_from_rw(bVal,aVal, 4, rd.randint(1, 3))

==

text==#|markdown|

<div>{{intituleQuestion}} ?</div>
<div><small>{{indicQuestion}}</small></div>

==

form==
{{ checkbox|component }}
==

settings.feedback = lightscore
evaluator ==
feedback = " "
score = checkbox.eval()
==


