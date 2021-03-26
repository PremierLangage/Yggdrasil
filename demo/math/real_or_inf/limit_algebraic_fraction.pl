extends = /model/mathquill.pl

title = Limite d'une fraction rationnelle

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
score, error =  eval_real_or_inf(ianswers['math'], sol)
feedback = message[error]
==

solution ==
La limite est $% {{sol|latex}} %$.
==



