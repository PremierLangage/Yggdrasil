extends = /model/math/multimathinput.pl

title = Simplification de valeurs abolues


before == #|py|
from sympy import solveset, EmptySet, Interval, S

var('x')

def refine_absval(expr, var, domain):
    replacements = {}
    for a in expr.atoms(Abs):
        if solveset(a.args[0]>0, var, domain) == EmptySet:
            replacements[a] = -a.args[0]
        elif solveset(a.args[0]<0, var, domain) == EmptySet:
            replacements[a] = a.args[0]
    return expr.xreplace(replacements)

n = 2
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []
assumps = []
for i in range(n):
    while True:
        a = randint(-6, 6, [0])
        b = randint(-6, 6, [0])
        c = randint(-6, 6, [0])
        d = randint(-6, 6, [0])
        x1 = -Rational(b, a)
        x2 = -Rational(c, d)
        if x1 != x2:
            break
    expr1 = a*x + b
    expr2 = c*x + d
    xmin = min([x1, x2])
    xmax = max([x1, x2])
    case = randint(0, 2)
    if case == 0:
        ineq = x <= xmin
        domain = Interval(-oo, xmin)
        assumps.append(rf"$! {latex(ineq)} !$")
    elif case == 1:
        ineq = x >= xmax
        domain = Interval(xmax, oo)
        assumps.append(rf"$! {latex(ineq)} !$")
    else:
        domain = Interval(xmin, xmax)
        assumps.append(rf"$! x \in {latex(domain)} !$")
    if i == 0:
        inputs[i].sol = refine_absval(Abs(expr1) + Abs(expr2), x, domain)
        prefixes.append(rf"$! |{latex(expr1)}| + |{latex(expr2)}| = !$")
    else:
        inputs[i].sol = refine_absval(Abs(expr1) - Abs(expr2), x, domain)
        prefixes.append(rf"$! |{latex(expr1)}| - |{latex(expr2)}| = !$")

==

question ==
Réécrire les expressions suivantes (en fonction des hypothèses données sur $! x !$) sans utiliser de valeur absolue.
==

inputblock ==
{% for i in range(n) %}
<div style="display: block; margin-bottom: 1em;">
{{i+1}}. On suppose  {{ assumps[i] }}. <br><br>
{{ prefixes[i] }} 
{{ inputs[i]|html }}
</div>
{% endfor %}
==