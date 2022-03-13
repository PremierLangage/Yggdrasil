extends = /model/math/chainineq.pl

before ==
sol = Interval.Ropen(0, 2)
expr = "x"
==

question ==
Soit $! x \in {{ sol|latex }} !$. En déduire un encadrement de $x$.
==
