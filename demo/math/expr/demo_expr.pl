extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
sol = x+1
==

text ==
Entrer l'expression $! {{ sol|latex}} !$.
==
