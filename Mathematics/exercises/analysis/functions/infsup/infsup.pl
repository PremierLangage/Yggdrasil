extends = /model/math/input.pl

title = Bornes d'un ensemble

before == #|python|
a = randint(-4, 0)
b = a + randint(1, 4)
var('x')
f = choice([x**2+1, x**2-1, 1-x**2, -1-x**2])


inputs = [MathInput() for _ in range(2)]
prefixes = ["$! \inf A  = !$", "$! \sup A = !$"]

from sympy.calculus.util import minimum, maximum

inputs[0].sol = minimum(f, x, Interval(a,b))
inputs[1].sol = maximum(f, x, Interval(a,b))
==

question == 
On considère l'ensemble
$$ A = \{ {{ f|latex }} \: | \: x \in [{{ a }}, {{ b }}] \}. $$
Déterminer les bornes de cet ensemble.
==

jinja_keys = ["prefix", "question", "solution", "inputblock"]

inputblock ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
{{ input|mathinput }}
</div>
{% endfor %}
==


solution ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
$! {{ input.sol|latex }} !$
</div>
{% endfor %}
==

evaluator ==
from mathinput import MathInput
MathInput.message = message

for input in inputs:
    input.value = answers[input.id]
    input.eval()
    input.display_feedback()

score = -1
==