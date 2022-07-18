extends = /model/math/set.pl

title = Opérations sur les ensembles

before ==
from sympy import Union, Intersection

A = FiniteSet(*sample(range(10), randint(4, 7)))
B = FiniteSet(*sample(range(10), randint(4, 7)))

case = choice(param['cases'])

if case == "union":
    expr = r"A \cup B"
    sol = Union(A, B)
elif case == "inter":
    expr = r"A \cap B"
    sol = Intersection(A, B)
elif case == "diff":
    expr = r"A \setminus B"
    sol = B.complement(A)
elif case == "symdiff":
    expr = r"A \,\triangle\, B"
    sol = B.symmetric_difference(A)
==

question == 
On considère les ensembles suivants :
$$ A= {{ A|latex }},\ B= {{ B|latex }}.$$
Déterminer $! {{expr}} !$.
==