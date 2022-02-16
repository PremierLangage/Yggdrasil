extends = /model/math/multinput.pl
@ /utils/components/radio.py [radio.py]

jinja_keys = ["intro", "questions", "solution", "inputblock", "inputblocks"]

title = Nombres Complexes

before == #|python|
x = Symbol('x')
a = randint(-4, 4, [0])
b = randint(-4, 4, [0])
c = randint(-4, 4, [0])
P= a*x**2+b*x+c
#lstsol = list(solveset(P,x,domain=S.Reals))

input0 = MathInput()
input0.sol = b**2-4*a*c
input0.type = "expr"
from radio import Radio
radio = Radio()
radio.fill(["Aucune racine réelle", "Une racine réelle double.", "Deux racines réelles distinctes"], 2, False)

istep = 0
steps = ['disc', 'nbsol']
nbsteps = len(steps)
score = -1
==

intro ==
$$ {{ P|latex }} $$
==

questions.disc == 
Calculer le discriminant de ce trinôme.
==

inputblocks.disc == 
{{ input0|mathinput }}
==

eval.disc ==
input0.value = answers[input0.id]
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
scorestep = radio.eval()
radio.show()
radio.disable()
==



evaluator ==
step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    istep += 1

if istep > nbsteps:
    istep = nbsteps
    state == "final"

==
tplpage =@ template.html