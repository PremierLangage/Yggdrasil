extends = /model/math/multistep.pl

before == #|python|
x = Symbol('x')
a = randint(-4, 4, [0])
b = randint(-4, 4, [0])
c = randint(-4, 4, [0])
P = a*x**2+b*x+c
#lstsol = list(solveset(P,x,domain=S.Reals))
sequence = [StepMath(), StepRadio()]
disc = b**2-4*a*c

sequence[0].input.sol = disc

if disc > 0:
    indsol = 2
elif disc < 0:
    indsol = 0
else:
    indsol = 1

sequence.input.fill(["Aucune racine réelle", "Une racine réelle double.", "Deux racines réelles distinctes"], indsol, False)

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
