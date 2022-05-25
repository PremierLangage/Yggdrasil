extends = /model/math/multimathinput.pl

title = Simplification de valeurs abolues


before == #|py|
from sympy import solveset, EmptySet, Interval

var('x')

def refine_absval(expr, var, domain):
    replacements = {}
    for a in expr.atoms(Abs):
        if solveset(a.args[0]>0, var, domain) == EmptySet:
            replacements[a] = -a.args[0]
        elif solveset(a.args[0]<0, var, domain) == EmptySet:
            replacements[a] = a.args[0]
    return expr.xreplace(replacements)

n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []
for i in range(n):
    a = randint(-6, 6, [0])
    b = randint(-6, 6, [0])
    x0 = -Rational(b, a)
    expr = Abs(a*x + b)
    inputs[i].sol = refine_absval(expr, x, Interval(1, oo))
    prefixes.append(rf"$! {latex(expr)} = !$")

==

question ==
Réécrire les expressions suivantes sans utiliser de valeur absolue.
==


