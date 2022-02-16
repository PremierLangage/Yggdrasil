extends = /model/math/multinput.pl

jinja_keys = ["prefix", "question", "solution", "inputblock", "inputblocks"]

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
steps = ['a1', 'toto']
nbsteps = len(steps)
score = -1
==

evaluator ==

step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    istep +=1

==
question == 
Calculer les produits de nombres complexes suivants (sous forme algébrique).
==

questions.a1 == 
Calculer 1
==

questions.toto == 
Calculer toto
==

inputblocks.a1 == 
{{ inputs[0]|mathinput }}
==

inputblocks.toto == 
{{ inputs[1]|mathinput }}
{{ inputs[2]|mathinput }}
==

eval.a1 ==
input0.value = "0"
input0.eval()
input0.display_feedback()
scorestep = inputs[0].score
==

eval.toto ==
inputs[1].sol = 0
inputs[1].eval()
inputs[1].display_feedback()
inputs[2].sol = 0
inputs[2].eval()
inputs[2].display_feedback()
scorestep = inputs[2].score
==

tplpage =@ template.html