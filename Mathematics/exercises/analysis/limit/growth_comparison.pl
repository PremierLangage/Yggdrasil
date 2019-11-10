extends = /Mathematics/template/mathinput.pl

title = Calcul de limites

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

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

evaluator==
score,_,feedback=ans_real_extended(input.value,sol)
==



