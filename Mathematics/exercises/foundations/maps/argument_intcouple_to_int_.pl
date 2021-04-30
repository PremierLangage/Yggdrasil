extends = /model/math/tuple.pl

title = Antécédent

before ==
#n, m = sample(symbols("n,m,p,q,r"), 2)

# expr = choice(sympify(exprlist))

var('n m')

f = Lambda((n, m), n+m)
expr = n+mathy= 2
==

text ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f( {{n|latex}}, {{m|latex}})= {{ expr|latex }}$$
Déterminer un antécédent de $! {{y|latex}} !$ par  $! f !$
==