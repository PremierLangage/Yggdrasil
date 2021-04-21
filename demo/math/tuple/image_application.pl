extends = /model/math/tuple.pl

title = Image d'une application

before ==
n0 = randint(-5, 5)
p0 = randint(-5, 5)

sol = [n0+p0, n0-p0]
==

text ==
On considère la fonction $! f : \mathbb{Z}^2 \rightarrow \mathbb{Z}^2  !$ telle que :
$$ f(n, p)= (n+p, n-p) .$$

Déterminer $! f( {{ n0, p0 }} ). !$
==
