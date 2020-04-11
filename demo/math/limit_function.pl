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
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ineq.latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator ==
score, _, feedback = eval_rset(input.value, sol)
==

solution ==
La solution est $% {{sol.latex}} %$.
==
