extends = /model/math/set.pl

title = Intersection d'ensembles

before ==
A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))
sol = Intersection(A,B)
==

text ==
On considère les ensembles suivants :
$$ A=\\{ {{A|latex}} \\},\ B=\\{ {{B|latex}} \\}.$$
Déterminer $! A \cap B !$.
==