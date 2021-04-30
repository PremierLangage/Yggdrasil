extends = /model/math/tuple.pl

title = Antécédent

before ==
var('n m')
expr = choice(sympify(exprlist))
f = Lambda((n, m), expr)

E1 = choice(["N","Z"])
if E1=="N":
    x1 = randint(0, 3)
    E1_tex="\mathbb{N}"
else:
    x1 = randint(-3, 3)
    E1_tex="\mathbb{Z}"

E2 = choice(["N","Z"])
if E2=="N":
    x2 = randint(0, 3)
    E2_tex = "\mathbb{N}"
else:
    x2 = randint(-3, 3)
    E2_tex = "\mathbb{Z}"

y = f(x1, x2)

v1, v2 = sample(symbols("n m p q r"), 2)
expr.subs(n, v1)
expr.subs(m, v1)
sol = Tuple(3, 4)
==

text ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f( {{n|latex}}, {{m|latex}})= {{ expr|latex }}$$
Déterminer un antécédent de $! {{y|latex}} !$ par  $! f !$
==