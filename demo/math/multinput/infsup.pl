extends = /model/math/multinput.pl

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

inputblock ==
La borne inf est : {{ inputs[0]|mathinput }}
{{ inputs[1]|mathinput }}
==