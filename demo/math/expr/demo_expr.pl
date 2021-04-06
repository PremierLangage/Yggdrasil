extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
sol = ln(Abs(x))
==

text ==
Entrer l'expression $! {{ sol|latex}} !$.
==
