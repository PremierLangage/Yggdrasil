extends = /model/math/set.pl

title = Ensemble des parties d'un ensemble


before ==
A = FiniteSet(*sample(range(10), randint(2, 3)))
sol = A.powerset()
==

text == 
Ecrire en extension l'ensemble $! \mathcal{P}(\\{ {{ A|latex }} \\}) !$.
==