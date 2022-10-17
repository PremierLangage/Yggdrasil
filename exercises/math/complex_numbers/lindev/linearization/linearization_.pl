extends = /model/math/input_eval.pl

title = Linéarisation d'expressions trigonométriques

before ==
x = Symbol('x')
expr = sympify(choice(expressions.split()))
sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()
==

evaluator ==
from latex2sympy import latex2sympy
from evalsympy import equal, arg_flat_add, arg_flat_mul
from sympy import Pow

def lin_term(expr):

    if expr.count(sin) + expr.count(cos) > 1:
        return False
    for a in arg_flat_mul(expr):
        if a.has(Pow) and (a.has(sin) or a.has(cos)):
            return False
    return True

try:
    ans = latex2sympy(input.get_value())
except:
    score = -1
    feedback = "La réponse doit être une expression mathématique."
else:
    if not all([lin_term(f) for f in arg_flat_add(ans)]):
        score = -1
        feedback = "La réponse doit être une expression trigonométrique linéarisée."
    elif not equal(ans, sol):
        score = 0
        feedback = "La réponse n'est pas égale à l'expression d'origine."
    else:
        score = 100
        feedback = ""
==

question ==
Linéariser l'expression $! {{expr|latex}} !$.
==

solution ==
L'expression linéarisée est $! {{ sol|latex }} !$.
==