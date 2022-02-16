extends = /model/math/multinput.pl
@ /utils/components/radio.py [radio.py]

jinja_keys = ["intro", "questions", "solutions", "solution", "inputblock", "inputblocks"]

title = Nombres Complexes

before == #|python|
x = Symbol('x')
a = randint(-4, 4, [0])
b = randint(-4, 4, [0])
c = randint(-4, 4, [0])
P= a*x**2+b*x+c
#lstsol = list(solveset(P,x,domain=S.Reals))

input0 = MathInput()
disc = b**2-4*a*c
input0.sol = disc
input0.type = "expr"
from radio import Radio
radio = Radio()
if disc > 0:
    indsol = 2
elif disc < 0:
    indsol = 0
else:
    indsol = 1
radio.fill(["Aucune racine réelle", "Une racine réelle double.", "Deux racines réelles distinctes"], indsol, False)

istep = 0
steps = ['disc', 'nbsol']
nbsteps = len(steps)
score = -1
scores = []
==

intro ==
On considère le trinôme suivant :
$$ {{ P|latex }}.$$
==

questions.disc == 
Calculer le discriminant de ce trinôme.
==

inputblocks.disc == 
<div style="display: block; margin-top: 1em;margin-bottom: 1em;">
Réponse : 
{{ input0|mathinput }}
</div>
==

solutions.disc == 
<div style="display: block;">
Réponse : 
$! {{ disc|latex }} !$
</div>
==

eval.disc ==
input0.value = answers[input0.id]
input0.eval()
input0.display_feedback()
scorestep = input0.score
==

questions.nbsol == 
Combien de racines réelles possède ce trinôme ?
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
    scores.append(scorestep)
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)

==
tplpage =@ template.html