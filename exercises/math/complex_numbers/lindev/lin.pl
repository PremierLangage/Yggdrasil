extends = /model/math/expr.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

before ==
x = Symbol('x')
expr = sin(2*x)*sin(3*x)

sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()

==

evalparam ==
from sympy import sympify
if modulo != 0:
    modulo = sympify(modulo)
input.evalparam = {'equality': "", 'modulo': 0, 'checkratsimp': True, 'unauthorized_func': [sp.Pow], 'local_dict': {}}
==

question ==
Linéariser l'expression $! {{expr|latex}} !$.
==