extends = /model/math/math.pl
extends = /model/math/messages_math.pl
extends = /model/math/aux_mathinput.pl

extends = /model/basic/hackpage.pl

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib2.py [builderlib.py]

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]

@ /utils/inputfields/radio.py
@ /utils/inputfields/checkbox.py
@ /utils/inputfields/textinput.py
@ /utils/inputfields/numinput.py
@ /utils/inputfields/dropgroup.py
@ /utils/inputfields/inputgroup.py
@ /utils/inputfields/scoring.py
@ /utils/inputfields/mathinput.py

@ /utils/steps/steps.py
@ /utils/steps/stepmath.py

@ /utils/plrandom.py
@ /utils/plcsv.py




jinja_keys = ["intro","inputblock0"]

before == #|python|
from exmath import ExMath

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