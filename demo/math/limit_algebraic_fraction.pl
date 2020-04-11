extends = /model/mathinput.pl

title = Inéquation produit

input.virtualKeyboards = functions

before ==
var('x')

degf = randint(1,3)
nbf = randint(2, degf+1)
f=rand_int_poly(degf, nbf, 5, "x")
degg = randint(1,3)
nbg = randint(2, degg+1)
g=rand_int_poly(degg, nbg, 5, "x")

lim=Limit(f/g, x, oo)
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
