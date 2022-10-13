extends = /model/math/expr.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

before ==
x = Symbol('x')
expr = sin(2*x)*sin(3*x)

sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()

==

question ==
Linéariser l'expression $! {{expr|latex}} !$.
==