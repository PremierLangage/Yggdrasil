extends = /model/mathinput.pl

title = Calcul de primitive

lang = fr

input.virtualKeyboards = sets

before ==

var('x')
a=randitem([Rational(1,2),Rational(1,3),Rational(1,4),2,3,4])
b=randint(-3,3,[0])
f=randitem([sin(a*x+b),cos(a*x+b),sin(a*x)+b,cos(a*x)+b])
latexf=latex(f)
sol=integrate(f,x).doit()
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{latexf}} $$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==




