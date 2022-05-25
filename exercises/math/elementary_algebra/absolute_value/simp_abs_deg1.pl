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

n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []
ineqs = []
for i in range(n):
    a = randint(-6, 6, [0])
    b = randint(-6, 6, [0])
    x0 = -Rational(b, a)
    expr = a*x + b
    if randint(0, 1) == 0:
        ineq = x <= x0
    else:
        ineq = x >= x0
    ineqs.append(ineq)
    domain = solveset(ineq, x, domain=S.Reals)
    inputs[i].sol = refine_absval(Abs(expr), x, domain)
    prefixes.append(rf"$! |{latex(expr)}| = !$")

==

question ==
Réécrire les expressions suivantes (en fonction des hypothèses données sur $! x !$) sans utiliser de valeur absolue.
==

inputblock ==
{% for i in range(n) %}
<div style="display: block; margin-bottom: 1em;">
{{i+1}}. On suppose  $! {{ ineqs[i]|latex }} !$. <br><br>
{{ prefixes[i] }} 
{{ inputs[i]|html }}
</div>
{% endfor %}
==

