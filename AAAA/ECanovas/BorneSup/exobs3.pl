

#extends = /model/mathinput.pl
extends = /lib/gift/templates/qtruefalse.pl

title==
 Borne Sup 3
==

@ bornesup.csv
@ genQuest.py

before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(3,uneLigne)

==

text==#|markdown|

<span>{{intituleQuestion}}</span> 
<span>{{indicQuestion}}</span> 
==

# Expected answer (T or F)
answer = F

# Feedback shown when the student gives the right answer
feedback_correct==
Bonne réponse !  👏👏👏 
==

# Feedback shown when the student gives the wrong answer
feedback_wrong==
Non la réponse était $%{bReponse}%$
==
