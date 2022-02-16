extends = /model/math/multinput.pl

jinja_keys = ["prefix", "question", "solution", "inputblock", "inputblocks"]

title = Nombres Complexes

before == #|python|
inputs = [MathInput() for _ in range(3)]
prefixes = []
for i in range(3):
    z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    s = latex(z1 * z2)
    prefixes.append(f"$! {s} = !$")
    inputs[i].sol = (z1 * z2).expand()
    inputs[i].type = "complex"
    inputs[i].evalparam = {'form': 'cartesian'}

step = 0
steps = ['a1', 'toto']
==

evaluator ==

step +=1
score = -1
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

tplpage =@ template.html