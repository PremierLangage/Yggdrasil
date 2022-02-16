extends = /model/math/multinput.pl

jinja_keys = ["prefix", "questions", "solution", "inputblock", "inputblocks"]

title = Nombres Complexes

before == #|python|
inputs = [MathInput() for _ in range(3)]
prefixes = []
for i in range(3):
    inputs[i].sol = 10
    inputs[i].type = "expr"

input0 = MathInput()
input0.sol = 10
input0.type = "expr"

istep = 0
steps = ['disc', 'toto']
nbsteps = len(steps)
score = -1
==

evaluator ==
step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    istep +=1
==

questions.disc == 
Calculer le discriminant de ce trinôme.
==

inputblocks.disc == 
{{ inputdisc|mathinput }}
==

eval.disc ==
inputdisc.value = answers[inputdisc.id]
inputdisc.eval()
inputdisc.display_feedback()
scorestep = inputdisc.score
==

questions.nbsol == 
Calculer toto
==

inputblocks.nbsol == 
{{ radio|component }}
==

eval.nbsol ==

==

tplpage =@ template.html