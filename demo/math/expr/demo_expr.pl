extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
sol = ln(1+x)
==

text ==
Entrer l'expression $! {{ sol|latex}} !$.
==
