extends = /model/math/interval.pl

title = Intervalles

keypad = ["-infty", "+infty"]

before ==
a = choice([0, 1, -oo])
b = choice([3, 5, oo])
left_open = choice([True, False])
right_open = choice([True, False])
sol = Interval(a, b, left_open, right_open)
==

question ==
Entrer l'intervalle $! {{ sol|latex }} !$.
==