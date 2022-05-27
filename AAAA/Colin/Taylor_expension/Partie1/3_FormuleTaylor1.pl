extends = /model/math/expr.pl

before ==
var('x')
n = 4
a0 = randint(-10, 10)
a1 = randint(-10, 10)
a2 = randint(-10, 10)
a3 = randint(-10, 10)
a4 = randint(-10, 10)
sol = a0 + a1 * x + a2 * x**2/2 + a3 * x**3/6 + a4 * x**4/24
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^n !$ sur $!\mathbb R!$ telle que $!f^{(i)}(0) = ai!$, pour $! i \in \llbracket 0, n\rrbracket!$. 
A l'aide de la formule de Taylor, donner le développement limité de $f$ en 0 et à l'ordre $! {{ n }} !$.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! f(x) = !$
==

solution ==
$! {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'
