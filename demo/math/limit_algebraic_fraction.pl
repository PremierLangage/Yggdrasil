extends = /model/mathinput.pl

title = Inéquation produit

input.virtualKeyboards = functions

before ==
var('x')


f=rand_int_poly(randint(1,3),randint(2,3),5,"x")
g=rand_int_poly(randint(1,3),randint(2,3),5,"x")
lim=Limit(f/g, x, a)

lim = Limit(f[0] - f[1], x, oo)
sol = lim.doit()
==

text ==
Déterminer $$ {{ lim.latex }}. $$
==

evaluator ==
score, _, feedback = eval_real_or_inf(input.value, sol)
==

solution ==
La limite est $% {{sol.latex}} %$.
==
