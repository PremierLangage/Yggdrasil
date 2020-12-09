extends = /model/mathinput.pl

title = Limite d'une fraction rationnelle

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
Déterminer $$ {{ lim|latex }}. $$
==

evaluator ==
score, error =  eval_real_or_inf(input.value, sol)
feedback = message[error]
==

solution ==
La limite est $% {{sol|latex}} %$.
==



