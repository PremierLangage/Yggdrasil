extends = /model/math/chainineq.pl

before ==
sol = Interval.Ropen(0, 2)
expr = "x"
==

question ==
Entrer l'intervalle $! {{ sol|latex }} !$.
==
