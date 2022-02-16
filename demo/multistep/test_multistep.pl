extends = /model/math/multinput.pl
@ /utils/components/radio.py [radio.py]

jinja_keys = ["prefix", "questions", "solution", "inputblock", "inputblocks"]

title = Nombres Complexes

before == #|python|
input0 = MathInput()
input0.sol = 10
input0.type = "expr"
from radio import Radio
radio = Radio()
radio.fill(["Aucune racine réelle", "Une racine réelle double.", "Deux racines réelles distinctes"], 2, False)

istep = 0
steps = ['disc', 'nbsol']
nbsteps = len(steps)
score = -1
==

questions.disc == 
Calculer le discriminant de ce trinôme.
==

inputblocks.disc == 
{{ input0|mathinput }}
==

eval.disc ==
input0.value = answers[inputdisc.id]
input0.eval()
input0.display_feedback()
scorestep = input0.score
==

questions.nbsol == 
Calculer toto
==

inputblocks.nbsol == 
{{ radio|component }}
==

eval.nbsol ==

==



evaluator ==
step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    istep +=1
==
tplpage =@ template.html