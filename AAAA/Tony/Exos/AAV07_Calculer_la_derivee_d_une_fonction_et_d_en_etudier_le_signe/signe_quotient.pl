extends = /model/math/interval.pl

before == 
a = randint(-5,5)
b = randint(-5,5)
c = randint(-5,5)


sol = Interval(-oo, b-a)
==

question ==
Ecrire sous forme d'intervalle l'ensemble des réels $! \frac{(x-a)(x-b)}{(x-c)} \geq 0 !$.
==

keypad = ["-infty", "+infty", "cup", "cap"]
