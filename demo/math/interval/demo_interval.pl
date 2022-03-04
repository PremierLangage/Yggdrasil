extends = /model/math/interval.pl

before ==
sol = Interval.Ropen(0, 2)
==

question ==
Entrer l'intervalle $! {{ sol|latex }} !$.
==