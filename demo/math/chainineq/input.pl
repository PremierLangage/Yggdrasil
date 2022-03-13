extends = /model/math/chainineq.pl

before ==
a = randint(0, 2)
b = a + randint(1, 3)
sol = Interval(a, b)
sol.left_open = choice([True, False])
sol.right_open = choice([True, False])

expr = "x"
==

question ==
Soit $! x \in {{ sol|latex }} !$. En déduire un encadrement de $!x !$.
==
