extends = /model/math/input_eval.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

expressions ==
sin(2*x)*sin(3*x)
sin(3*x)*sin(2*x)
==

before ==
x = Symbol('x')
expr = sympify(choice(expressions.split()))
sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()

==

evaluator ==
from latex2sympy import latex2sympy
from evalsympy import equal, arg_flat_add
from sympy import Pow

def lin_term(expr):
    if expr.has(Pow):
        return False
    if expr.count(sin) + expr.count(cos) > 1:
        return False
    return True

try:
    ans = latex2sympy(input.get_value())
except:
    score = -1
    feedback = "La réponse doit être un entier."
else:
    if not all([lin_term(f) for f in arg_flat_add(ans)]):
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
Linéariser l'expression $! {{expr|latex}} !$.
==