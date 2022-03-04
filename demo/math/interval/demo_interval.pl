extends = /model/math/interval.pl

before ==
interv = Interval(0, 2)
==

question ==
Entrer l'intervalle {{ interv|latex }}
==