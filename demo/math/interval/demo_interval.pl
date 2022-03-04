extends = /model/math/interval.pl

title = Démonstration math/input

before ==
interv = Interval(0, 2)
==

question ==
Entrer l'intervalle {{ interv|latex }}
==