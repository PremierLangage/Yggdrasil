extends = /model/math/expr.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

before ==
x = Symbol('x')
expr = sin(2*x)*sin(3*x)

sol = expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()

==

evaluator ==
from latex2sympy import latex2sympy

try:
    ans = latex2sympy(input.get_value())
except:
    score = -1
    feedback = "La réponse doit être un entier."
else:
    if not ans.is_Integer:
        score = -1
        feedback = "La réponse doit être un entier."
    elif not (a <= ans <= b):
        score = 0
        feedback = f"La réponse doit être comprise entre {a} et {b}."
    elif not isprime(ans):
        score = 0
        feedback = "La réponse doit être un nombre premier."
    else:
        score = 100
        feedback = ""
==

question ==
Linéariser l'expression $! {{expr|latex}} !$.
==