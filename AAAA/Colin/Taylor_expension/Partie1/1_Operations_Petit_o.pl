# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o

extends = /model/math/expr.pl

title = DL - Opérations sur les petits 0.

before ==
var('x')
n = randint(1, 4)
m = randint(4,6)
f = x**n + x**m
sol = x**n
==

question ==
Simplifier l'expression $! o(x^{{n|latex}}) + o(x^{{n|latex}}) !$ (pour x qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ pour un $! n !$ bien choisi.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'

