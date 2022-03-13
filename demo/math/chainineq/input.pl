extends = /model/math/chainineq.pl

before ==
sol = Interval.Ropen(0, 2)
sol.left_open = choice([True, False])
sol.right_open = choice([True, False])

expr = "x"
==

question ==
Soit $! x \in {{ sol|latex }} !$. En déduire un encadrement de $x$.
==
