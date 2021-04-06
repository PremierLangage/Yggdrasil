extends = /model/math/expr.pl


title = Graphique

before ==
from mplsympy import plotsvg
x = symbols('x')
a = choice([-1, 1]) * choice([1, 2, 3, Rational(1, 2), Rational(3, 2), Rational(1, 3), Rational(2, 3), Rational(4, 3)])
b = randint(-2, 2)
image = plotsvg(a*x+b)
==

text ==
<div class="img-container">
{{image}}
</div>
==
