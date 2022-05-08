# Author: D. Doyen
# Tags: fractions, irreducible fraction, gcd
# Simplifier une fraction
# Parameters:
# - nbsize: taille des nombres
# 19/7/2021

extends = /model/math/expr.pl

title = Simplifier une fraction

param.types = [0, 0, 1, 1]

before ==
types = param['types']:
n = len(types)
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(i):
    if i == 0:
        lstf=[[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[9,1],[3,2],[4,3],[5,4],[5,3],[5,2],[6,5],[7,6],[7,5],[7,4],[7,3],[7,2],[8,7],[8,5],[8,3]]
        lstc=[5,6,7,8,9,11,12,14,15]
    if i ==1:
        lstf=[[3,2],[4,3],[5,4],[5,3],[5,2],[6,5],[7,6],[7,5],[7,4],[7,3],[7,2],[8,7],[8,5],[8,3],[9,8],[9,7],[9,5],[9,4],[9,2]]
        lstc=[16,18,21,22,24,25,27,28,32,33,35]
    f=choice(lstf)
    shuffle(f)
    c=choice(lstc)
    a,b=c*f[0],c*f[1]
    sol=Rational(a,b)
    expr = r"$! \displaystyle \frac{ %s }{ %s } = !$" % (a, b)
    return expr, sol

prefixes = []
for i in range(n):
    expr, sol = generate(types[i])
    prefixes.append(expr)
    inputs[i].sol = sol

==

question ==
Simplifier la fraction $% \displaystyle \frac{ {{a}} }{ {{b}} } %$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==