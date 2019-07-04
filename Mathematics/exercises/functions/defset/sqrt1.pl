extends = /Mathematics/template/mathexpr.pl

title = Ensemble de définition (racine carrée 1)

lang = fr

input.1.virtualKeyboards = sets

before ==
a=randint(-6,6,[0,1,-1])
b=randint(-6,6,[0])
x=symbols('x')
f=sqrt(a*x+b)
latexf=latex(f)
from sympy.solvers.inequalities import solve_univariate_inequality
sol = solve_univariate_inequality(a*x+b >= 0, x, relational=False)
==

text ==
Déterminer l'ensemble de définition de la fonction $%f : x \mapsto {{latexf}}%$.
==

evaluator==
score,_,texterror=ans_real_set(answer['1'],sol)
feedback=str(str2realset(answer['1']))
==



