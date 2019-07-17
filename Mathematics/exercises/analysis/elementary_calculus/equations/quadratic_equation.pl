extends = /Mathematics/template/mathexpr.pl

title = Inéquations linéaires

lang = fr

input.1.virtualKeyboards = sets

before ==
from sympy.solvers.inequalities import solve_univariate_inequality
a=randint(-3,3,[0])
b=randint(-3,3,[0])
c=randint(-3,3,[0])
var('x')
f=a*x**2+b*x+c
eq=randitem([Eq(a*x**2+b*x+c,0),Eq(a*x**2+b*x,-c),Eq(a*x**2,-b*x-c)])
sol = solveset(eq, x, domain=S.Reals)
latexeq=latex(eq)
==

text ==
Déterminer les solutions de l'équation $$ {{latexeq}}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==

evaluator==
score,_,feedback=ans_interval(answer['1'],sol)
==


