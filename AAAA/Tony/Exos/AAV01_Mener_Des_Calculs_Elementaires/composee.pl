extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
f = x**2
g = 2*x+1
sol = f.subs(x,g)
==

question ==
Soit f :  $! x \mapsto {{ f|latex}} !$.
Entrer l'expression  $! f({{ g|latex}}) !$.
==
