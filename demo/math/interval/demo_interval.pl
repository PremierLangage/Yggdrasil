extends = /model/math/interval.pl

before ==
sol = Interval(0, 2)
==

question ==
Entrer l'intervalle $! {{ sol|latex }} !$.
==