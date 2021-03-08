

# pour avoir du Latex dans le builder et le grader
extends = /model/basic.pl
# nombre de tentatives
settings.maxattempt % 1

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

extends = /gift/templates/qtruefalse.pl

title==
 Borne Sup.
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

bVal=[bReponse['bonnes']]
aVal=[bReponse['autres']]
checkbox.setdata_from_rw([bReponse['bonnes']], [bReponse['autres']], 4, rd.randint(1, 4))

==

text==#|markdown|

<div>{{intituleQuestion}} ?</div>
<div><small>{{indicQuestion}}</small></div>
<div><small>{{bVal}} et {{aVal}}</small></div>
==

form==
{{ checkbox|component }}
==

settings.feedback = lightscore
evaluator ==
feedback = " "
score = checkbox.eval()
==
# Feedback shown when the student gives the right answer
#feedback_correct==
#<div class="success-state"><h1>Bonne réponse</h1>Good 👏👏👏 </div>
#==


