extends = /model/mathinput.pl

title = Inéquation produit

input.virtualKeyboards = functions

before ==
var('x')

n = randint(1,5)   
fs = randitem([[x**n,exp(x)],[x**n,ln(x)],[exp(x),ln(x)]])
rd.shuffle(f)
lim = Limit(f[0] - f[1], x, oo)
sol = lim.doit()
==

text ==
Déterminer $$ {{lim.latex}}.
==

evaluator ==
score, _, feedback = eval_real_or_inf(input.value, sol)
==

solution ==
La limite est $% {{sol.latex}} %$.
==
