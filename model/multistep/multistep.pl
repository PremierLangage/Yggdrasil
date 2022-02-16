extends = /model/math/multinput.pl
@ /utils/components/radio.py [radio.py]

jinja_keys = ["intro", "questions", "solutions", "solution", "inputblock", "inputblocks"]

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