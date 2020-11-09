extends = /model/math/finite_sets.pl

title = Image d'une application

before ==
var('n')
expr1 = randitem([n, n+1, n-1, 2*n, 2*n+1, 2*n-1])
expr2 = randitem([n, n+1, n-1, 2*n, 2*n+1, 2*n-1])

f = Lambda(n, (expr1, expr2))

A = rand_finiteset(3, 0, 5)
sol = FiniteSet(*[f(x) for x in A])
==

text ==
On considère la fonction $! f : \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z} !$ telle que
$$f(n)= ({{expr1|latex}}, {{expr1|latex}})$$
Déterminer $! f(\\{ {{A|latex}} \\}). !$
==

