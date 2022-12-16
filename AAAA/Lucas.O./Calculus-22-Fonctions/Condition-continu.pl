title = Conditions de continuité
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')
var('a')

n = randint(1, 10)
p = randint(1, 10)
m = randint(1, 10)

f = a*sqrt(x + n)
g = p*x + m

sol = m/sqrt(n)
==

question ==
Donner la valeur de $! a !$ pour que la fonction $! h !$ définie par $! \\
    h(x) = \begin{cases} {{ f|latex }} & \text{ si } x > 0 , \\ 
    {{ g|latex }} & \text{ si } x < 0 \end{cases} !$
    soit continue sur $! \mathbb{R} !$.
==

embed ==
==

prefix ==
$! {{ a|latex }} = !$
==

latexsettings.order = 'ilex'


