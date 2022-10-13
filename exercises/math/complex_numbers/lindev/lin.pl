extends = /model/math/input_eval.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

before ==
x = Symbol('x')
expr = sin(2*x)*sin(3*x)

sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()

==

evaluator ==
from latex2sympy import latex2sympy
from evalsympy import equal
from sympy import log


try:
    ans = latex2sympy(input.get_value())
except:
    score = -1
    feedback = "La réponse doit être un entier."
else:
    if ans.func == log:
        score = -1
        feedback = "Pas linéarisé."
    elif not equal(ans, sol):
        score = 0
        feedback = "Pas égale."
    else:
        score = 100
        feedback = ""
==

question ==
Linéariser l'expression $! {{expr, sol|latex}} !$.
==