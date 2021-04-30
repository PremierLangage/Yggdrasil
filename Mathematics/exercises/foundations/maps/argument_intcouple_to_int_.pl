extends = /model/math/tuple.pl

title = Antécédent

before ==
#n, m = sample(symbols("n,m,p,q,r"), 2)

# expr = choice(sympify(exprlist))

var('n m')


expr = n+m
y= 2
==
test =