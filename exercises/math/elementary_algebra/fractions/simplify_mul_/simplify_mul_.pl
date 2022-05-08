# Author: D. Doyen
# Tags: fractions, irreducible fraction, gcd
# Simplifier une fraction
# Parameters:
# - nbsize: taille des nombres
# 19/7/2021

extends = /model/math/multimathinput.pl

title = Simplifier des fractions

param.types = [0, 0, 1, 1]

before ==
types = param['types']
n = len(types)
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(i):
    if i == 0:
        denom=101
        num=0
        while (denom>100) or (num>100):
            a,b,c,d=sample([10,12,14,15,16,18,20,21,24,25,27,28,30,32,33,35,36,40,42,44,45,48,49,50,52,54,55,56,60,63,64,65,70,72,80,81], 4)
            sol=Rational(a*c,b*d)
            num,denom=fraction(sol)
            expr=r"\frac{ %d }{ %d } \times \frac{ %d }{ %d }" % (a,b,c,d)
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
Simplifier les fraction suivantes (en les écrivant sous forme d'entiers ou de fractions irréductibles).
==
