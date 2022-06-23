# Auteur : Colin Petitjean
# Sujet : Développements Limités - Fonction Puissance alpha
# Maj : 9/06/2022

title = DL - Formules de références : Fonctions puissances

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
n = 3
p = [-3,-2,-Rational(1,2),Rational(1,2)]
a = choice(p)
f = (1+x)**a
sol = series(f, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ f|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n }} !$.
==

embed ==
# + o(x^{{ n }}) \quad [x \rightarrow 0] 
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$$ {{ f|latex }} = {{ sol|latex }} + o( x ^{{ n|latex}})  \quad [x \rightarrow 0] $$

En effet, il s'agit d'appliquer la formule de référence :

$$ (1+x)^{ a } = 1+ a x+ \frac{ a(a-1) }{2!}x^2 +\frac{ a(a-1)(a-2)}{3!}x^3 + o(x^3) \quad  \text{avec }  a = {{a|latex}}.  $$
==

latexsettings.order = 'ilex'

