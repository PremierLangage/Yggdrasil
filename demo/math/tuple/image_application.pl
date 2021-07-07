extends = /model/math/tuple.pl

before ==
n0 = randint(-5, 5)
p0 = randint(-5, 5)
sol = Tuple(n0+p0, n0-p0)
==

question ==
On considère la fonction $! f : \mathbb{Z}^2 \rightarrow \mathbb{Z}^2  !$  définie par :
$$ f(n, p)= (n+p, n-p) .$$

Déterminer $! f( {{ n0 }}, {{ p0 }} ). !$
==
