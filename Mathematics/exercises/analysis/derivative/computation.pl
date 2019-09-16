extends = /Mathematics/template/mathinput.pl

title = Calcul de dérivée

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON

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
$$ f : x \mapsto \sqrt{x^2+1} $$
==

evaluator==
score,_,feedback=ans_limit(input.value,sol)
==



