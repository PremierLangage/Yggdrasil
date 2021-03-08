

#extends = /model/mathinput.pl
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

feedback_wrong="Non la réponse était "
if bReponse=="F":
  feedback_wrong += " vrai (<i class='fas fa-times'></i>)"
else:
  feedback_wrong += " non (<i class='fas fa-check'></i>)"

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
Bonne réponse !  👏👏👏 
==

