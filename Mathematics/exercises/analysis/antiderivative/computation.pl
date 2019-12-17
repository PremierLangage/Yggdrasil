extends = /Mathematics/template/mathinput.pl

title = Calcul de dérivée

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
n=randint(1,4)
g=randitem([sin(x),cos(x),exp(x),ln(x)])
h=randitem([x,x**2])
f=g*h
latexf=latex(f)
sol=integrate(f,x).doit()
==

text ==
Calculer la primitive de 
$$ f : x \mapsto {{latexf}} $$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==





