extends = /model/math/tuple.pl

title = Antécédent

before ==
#n, m = sample(symbols("n,m,p,q,r"), 2)

# expr = choice(sympify(exprlist))

var('n m')


expr = n+m
y= 2
sol = Tuple(3, 4)
==

text ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f( {{n|latex}}, {{m|latex}})= {{ expr|latex }}$$
Déterminer un antécédent de $! {{y|latex}} !$ par  $! f !$
==

old ==

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
==