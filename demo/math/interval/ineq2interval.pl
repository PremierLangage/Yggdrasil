extends = /model/math/interval.pl

before ==
a = randint(1, 3)
b = randint(-3, 3)
sol = Interval(-oo, b-a)
==

question ==
Ecrire sous forme d'intervalle l'ensemble des réels $! x  + {{ a }} \le {{ b }}  !$.
==

keypad = ["-infty", "+infty"]
