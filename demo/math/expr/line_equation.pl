extends = /model/math/math.pl


title = Graphique

before ==
from plmpl import plotsvg
x = symbols('x')
a = Rational(randint(-4, 4, [0]),2)
b = randint(-2, 2)
image = plotsvg(a*x+b)
==

from=

text ==
<div class="img-container">
{{image}}
</div>
==
