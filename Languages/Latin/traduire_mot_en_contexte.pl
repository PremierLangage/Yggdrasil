extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 3
settings.cumulative % false

before == #|python|
from components import Input

sol = []
phrases = []
inputs = []
for i in range(nbstep):
    inputs.append(Input())
    phrases.append("phrase")
    sol.append[""]
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
Traduire en latin le mot en gras (avec le bon cas).
==

formstep ==
{{ inputs[step]|component }}
==

evaluatorstep ==
if inputs[step].value == sol[step]:
    score = 100
else:
    score = 0
==

