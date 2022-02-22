extends = /model/basic/utils.pl
extends = /model/basic/hackpage.pl
extends = messages_math.pl
extends = aux_mathinput.pl

text =

jinja_keys = ["intro","inputblock0"]

before == #|python|
from stepmath import StepMath

sequence = [ExMath(), ExMath()]
sequence[0].question = "toto"
sequence[0].input.sol = sqrt(3)
sequence[0].solution = "solution"
sequence[0].set_inputblock(inputblock0, globals())

sequence[1].question = "toto"
sequence[1].input.sol = sqrt(3)
sequence[1].solution = "solution"
sequence[1].inputblock = sequence[1].input.render()

# Créer champs de réponse
#inputblock = input.render()
istep = 0
nbsteps = len(sequence)
score = -1
scores = []
==

inputblock0 ==
toto : {{ sequence[0].input|mathinput }}
==


evaluator ==
for ex in sequence:
    ex.input.value = answers.get(ex.input.id, '')

scorestep = sequence[istep].input.eval()

sequence[istep].input.display_feedback()

for ex in sequence:
    ex.update(globals())

if scorestep >= 0:
    scores.append(scorestep)
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)

==

tplpage =@ /model/multistep/template2.html