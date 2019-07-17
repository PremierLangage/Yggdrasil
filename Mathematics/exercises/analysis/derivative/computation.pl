extends = /Mathematics/template/mathexpr.pl

title = Calcul de dérivée

lang = fr

before ==
var('x')
n=randint(1,4)
g=randitem([sin(x),cos(x),exp(x),ln(x)])
h=randitem([x,x**2])
f=g*h
latexf=latex(f)
sol=diff(f,x)
==

text ==
Calculer la dérivée de
$$ {{latexf}} $$
==

input.1.virtualKeyboards = functions

evaluator==
score,_,feedback=ans_limit(answer['1'],sol)
==

