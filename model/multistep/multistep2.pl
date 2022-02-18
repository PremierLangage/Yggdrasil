extends = /model/math/math.pl
extends = /model/basic/temp.pl
extends = /model/math/messages_math.pl
extends = /model/math/aux_mathinput.pl

@ /utils/components/radio.py [radio.py]

@ /utils/inputfields/mathinput.py

jinja_keys = ["intro"]

before == #|python|
from exmath import ExMath

# Créer champs de réponse
#inputblock = input.render()
==


evaluator ==
sequence[istep].input.value = answers[sequence[istep].input.id]
scorestep = sequence[istep].eval()
if scorestep >= 0:
    scores.append(scorestep)
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)

==

tplpage =@ template2.html
