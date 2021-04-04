extends = /model/math/set.pl

title = Ensemble des parties d'un ensemble


before ==
A = FiniteSet(*sample(range(10), randint(2, 3)))
sol = A.powerset()
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
Ecrire en extension l'ensemble $! \mathcal{P}(\\{ {{ A|latex }} \\}) !$.
==