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

text ==
Déterminer {{ lim.latex }}.
==

evaluator ==
# score, _, _ = eval_real_or_inf(input.value, sol)
ans = sympify(input.value)
try:
    ans = sympify(input.value)
except:
    pass
score = -1
==

solution ==
La limite est $% {{sol.latex}} %$.
==
