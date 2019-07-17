extends = /Mathematics/template/mathexpr.pl

title = Calcul de limites

lang = fr

before ==
var('x')
n=randint(1,4)
f,g=list_randitem_norep(2,[x**n,exp(x),ln(x)])
lim=Limit(f-g, x, oo)
latexlim=latex(lim)
sol=lim.doit()
==

text ==
$$ {{latexlim}} $$
==

input.1.virtualKeyboards = functions

evaluator==
score,_,feedback=ans_real_extended(answer['1'],sol)
==


