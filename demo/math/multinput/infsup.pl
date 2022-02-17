extends = /model/math/multinput.pl

title = Bornes d'un ensemble

before == #|python|
a = randint(-4, 0)
b = a + randint(1, 4) 
f = choice([x**2+1, x**2-1, 1-x**2, -1-x**2])
inputs = [MathInput() for _ in range(2)]
prefixes = []

from sympy.calculus.util import minimum, maximum

var('x')

prefixes[0] = "\inf A"
inputs[0].sol = minimum(f, x, Interval(a,b))
prefixes[1] = "\sup A"
inputs[1].sol = maximum(f, x, Interval(a,b))
==

question == 
On considère l'ensemble
$$ A = \{ {{ f|latex }} | x \in [a, b] \}
==
