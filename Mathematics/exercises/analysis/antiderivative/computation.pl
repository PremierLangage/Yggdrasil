extends = /Mathematics/template/mathinput.pl

title = Calcul de dérivée

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randitem([Rational(1,2),Rational(1,3),Rational(1,4),2,3,4])
f=randitem([sin(a*x),cos(a*x),exp(a*x)])
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





