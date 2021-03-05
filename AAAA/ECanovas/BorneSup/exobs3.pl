

#extends = /model/mathinput.pl
extends = /gift/templates/qtruefalse.pl

title==
 Borne Sup 3
==

@ bornesup.csv
@ genQuest.py

before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(3,uneLigne)

#expected F or T
answer=bReponse

feedback_wrong="Non la réponse était "+ bReponse
if bReponse=="F":
  feedback_wrong += " X"
else:
  feedback_wrong += " V"

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

<span>{{intituleQuestion}}</span> 
<span>{{indicQuestion}}</span> 
==

# Feedback shown when the student gives the right answer
feedback_correct==
Bonne réponse !  👏👏👏 
==

# Feedback shown when the student gives the wrong answer
#feedback_wrong==
#Non la réponse était {{bReponse}}
#==
