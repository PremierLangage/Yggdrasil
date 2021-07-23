extends = /model/math/interval.pl

title = Ensemble de définition (logarithme 1)

before ==
from sympy.solvers.inequalities import solve_univariate_inequality
a=randint(-6,6,[0,1,-1])
b=randint(-6,6,[0])
var('x')
f=ln(a*x+b)
sol = solve_univariate_inequality(a*x+b > 0, x, relational=False)
==

question ==
Déterminer l'ensemble de définition (maximal) de la fonction 

$$f : x \mapsto {{ f|latex }}.$$
==