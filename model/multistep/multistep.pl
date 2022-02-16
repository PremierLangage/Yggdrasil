extends = /model/math/math.pl
extends = /model/basic/temp.pl
extends = /model/math/messages_math.pl
extends = /model/math/aux_mathinput.pl

@ /utils/components/radio.py [radio.py]

jinja_keys = ["intro", "questions", "solutions", "inputblocks"]

title = Nombres Complexes

evaluator ==
step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    scores.append(scorestep)
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)

==

tplpage =@ template.html