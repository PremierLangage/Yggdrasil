

# pour avoir du Latex dans le builder et le grader
extends = /model/basic.pl
# nombre de tentatives
settings.maxattempt % 5

extends = /gift/templates/qtruefalse.pl


title==
 Borne Sup.
==

@ bornesup.csv
@ genQuest.py

before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(3,uneLigne)

#expected F or T
answer=bReponse

feedback_wrong="<div class='error-state'><h1>Mauvaise réponse</h1>Non la réponse était "
if bReponse=="F":
  feedback_wrong += " vrai (<i class='fas fa-times'></i>)"
else:
  feedback_wrong += " non (<i class='fas fa-check'></i>)"
feedback_wrong += "</div>"

# FROM templates !!
if answer != 'T' and answer != 'F':
    raise Exception('you must define a variable "answer = T or F"')

radio.horizontal = True
radio.items = [
    { "id": "choice1", "content": "<i class='fas fa-check'></i>" },
    { "id": "choice2", "content": "<i class='fas fa-times'></i>" }
]
==

text==#|markdown|

<div>{{intituleQuestion}} ?</div>
<div><small>{{indicQuestion}}</small></div>

==

# Feedback shown when the student gives the right answer
feedback_correct==
<div class="success-state"><h1>Bonne réponse</h1>Good 👏👏👏 </div>
==

