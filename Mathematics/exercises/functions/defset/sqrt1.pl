# Author: D. Doyen
# Tags: definition set, square root, linear inequality
# Déterminer l'ensemble de définition (maximal) d'une fonction
# 19/7/2021

extends = /model/math/interval.pl

before ==
a=randint(-6,6,[0,1,-1])
b=randint(-6,6,[0])
x=symbols('x')
f=sqrt(a*x+b)
latexf=latex(f)
from sympy.solvers.inequalities import solve_univariate_inequality
x=symbols('x')
sol = solve_univariate_inequality(a*x+b >= 0, x, relational=False)
ssol=str(sol)
==

text ==
{{ssol}}
Déterminer l'ensemble de définition de la fonction $%f : x \mapsto {{latexf}}%$.
==

evaluator==
score, feedback, _ = eval_rset(input.value, sol)
==
