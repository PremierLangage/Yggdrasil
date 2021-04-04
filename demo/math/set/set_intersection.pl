extends = /model/math/set.pl

title = Intersection d'ensembles

before ==
A = FiniteSet(*sample(randint(4, 7), range(10)))
B = FiniteSet(*sample(randint(4, 7), range(10)))
sol = Intersection(A, B)
==

text ==
On considère les ensembles suivants :
$$ A=\\{ {{A|latex}} \\},\ B=\\{ {{B|latex}} \\}.$$
Déterminer $! A \cap B !$.
==