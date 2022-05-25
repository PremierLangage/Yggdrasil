extends = /model/math/multimathinput.pl

title = Simplification de valeurs abolues


before == #|py|
from sympy import solveset, EmptySet, Interval

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
shuffle(lst)
prefixes = []
for i in range(3):
    a = lst[i]
    b = choice([randint(1,floor(a)),randint(ceiling(a),ceiling(a)+2)])
    a, b = sample([a,b], 2)
    inputs[i].sol = Abs(a-b)
    prefixes.append(rf"$! |{latex(a)} - {latex(b)}| = !$")



==

before ==
from sympy import floor, ceiling
n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
lst = [choice([2*pi,pi]),choice([2*sqrt(2),sqrt(2)]),choice([sqrt(3),2*sqrt(3)])]
shuffle(lst)
prefixes = []
for i in range(3):
    a = lst[i]
    b = choice([randint(1,floor(a)),randint(ceiling(a),ceiling(a)+2)])
    a, b = sample([a,b], 2)
    inputs[i].sol = Abs(a-b)
    prefixes.append(rf"$! |{latex(a)} - {latex(b)}| = !$")
==

question ==
Réécrire les expressions suivantes sans utiliser de valeur absolue.
==


