extends = /model/math/interval.pl

title = Ensemble de définition (logarithme 1)

before ==
a=randint(-6,6,[0,1,-1])
b=randint(-6,6,[0])
var('x')
f=ln(a*x+b)
from sympy.solvers.inequalities import solve_univariate_inequality
sol = solve_univariate_inequality(a*x+b > 0, x, relational=False)
==

question ==
Déterminer l'ensemble de définition de la fonction $%f : x \mapsto {{latexf}}%$.
==

evaluator==
score,_,feedback=ans_interval(answer['1'],sol)
==


