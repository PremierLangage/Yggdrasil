
extends = /model/mathinput.pl
# nombre de tentatives
settings.maxattempt % 1

title= Borne Sup.

@ bornesup.csv
@ genQuest.py


before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

# nombre de bonnes réponses
nbbr=0

intituleQuestion, indicQuestion, bReponse = question(2,uneLigne)

==

text==#|markdown|

<div>{{intituleQuestion}} ?</div>
<div><small>{{indicQuestion}}</small></div>

==
form==
{{ input|component}}
==

settings.maxattempt % 1

evaluator==
from genQuest import *

if testReponse(bReponse ,input.value):
    nbbr += 1 
    kback = f'<span class="success-state">Good 👏👏👏 </span>'
    grade = (100, kback)
else:
    kback =  f'<span class="error-state">la bonne réponse est $%{bReponse}%$ , différente de {input.value} </span>'
    grade = (0,kback)

==
