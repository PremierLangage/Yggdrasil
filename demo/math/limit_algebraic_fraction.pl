extends = /model/mathinput.pl

title = Inéquation produit

input.virtualKeyboards = functions

before ==
var('x')

deg = randint(1,3)
f = rand_int_poly(deg, randint(2, deg + 1), 5, "x")
deg = randint(1,3)
g = rand_int_poly(deg, randint(2, deg + 1), 5, "x")

lim = Limit(f/g, x, oo)
sol = lim.doit()
==
input.debug % true
text ==
Déterminer {{ lim.latex }}.
==

evaluator ==
score, _, feedback = eval_real_or_inf(input.value, sol)
==

solution ==
La limite est $% {{sol.latex}} %$.
==
