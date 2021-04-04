extends = /model/math/set.pl

title = Produit cartésien

before ==
lenA, lenB = choice([[2,3],[3,2],[2,2]])
A = FiniteSet(*sample(range(10), lenA))
B = FiniteSet(*sample(range(10), lenB))
sol = FiniteSet(*ProductSet(A, B))
==

evaluator ==
from ast import literal_eval
from evalsympy import eval_set
from latex2sympy import FiniteSet2struct, latex2sympy
score, error = eval_set(answers['math'], sol)
feedback = answers['math']+str(FiniteSet2struct(sol)) + str(latex2sympy(answers['math']))
#message[error]
==

text == 
Ecrire en extension l'ensemble $! \\{ {{A|latex}} \\} \times \\{ {{B|latex}} \\}. !$
==





