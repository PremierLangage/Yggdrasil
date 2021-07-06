extends = /model/math/interval.pl

before ==
a = randint(1, 3)
b = randint(-3, 3)
sol = Interval(-oo, b-a)
==

text ==
Ecrire sous forme d'intervalle l'ensemble des réels $! x  + {{ a }} \le {{ b }}  !$.
==

keypad % [{"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"}, {"label": "$! \\cup !$", "action": "cmd", "value": "\\cup"}]
