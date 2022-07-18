
# Scénarion/Enchainement par le pltp

extends = /model/mathinput.pl
# nombre de tentatives
settings.maxattempt % 1

title= Borne supérieure

@ bornesup.csv
@ genQuest.py


before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(1,uneLigne)

==

text==#|markdown|

<div>{{intituleQuestion}} ?</div>
<div><small>{{indicQuestion}}</small></div>

==
form==
{{ input|component}}
==

evaluator==
from genQuest import *
if testReponse(bReponse ,input.value):
    kback = f'<span class="success-state">Good 👏👏👏 </span>'
    grade = (100, kback)
else:
    kback =  f'<span class="error-state">la bonne réponse $%{bReponse}%$ est différente de  $%{input.value}%$ </span>'
    grade = (0,kback)

==
