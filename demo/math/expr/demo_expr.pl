extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
sol = 1 + I
==

symbol_dict = {'i': I}

text ==
Entrer l'expression $! {{ sol|latex}} !$.
==
