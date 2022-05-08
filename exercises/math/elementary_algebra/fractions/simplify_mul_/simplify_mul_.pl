# Author: D. Doyen
# Tags: fractions, irreducible fraction, gcd
# Simplifier une fraction
# Parameters:
# - nbsize: taille des nombres
# 19/7/2021

extends = /model/math/multimathinput.pl

title = Simplifier des fractions

param.types = [0, 1]

before ==
from sympy import fraction
types = param['types']
n = len(types)
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(i):
    denom=101
    num=0
    if i == 0:
        while (denom>100) or (num>100):
            a,b,c,d=sample([10,12,14,15,16,18,20,21,24,25,27,28,30,32,33,35,36,40,42,44,45,48,49,50,52,54,55,56,60,63,64,65,70,72,80,81], 4)
            sol=Rational(a*c,b*d)
            num,denom=fraction(sol)
            expr=r"\frac{ %d }{ %d } \times \frac{ %d }{ %d }" % (a,b,c,d)
    if i ==1:

        while (denom>100) or (num>100):
            a,b,c,d,e,f=sample([10,12,14,15,16,18,20,21,24,25,27,28,30,32,33,35,36,40,42,44,45,48,49,50,52,54,55,56,60,63,64,65,70,72,80,81], 6)
            sol=Rational(a*c*e,b*d*f)
            num,denom=fraction(sol)

        expr=r"\frac{ %d }{ %d } \times \frac{ %d }{ %d } \times \frac{ %d }{ %d }" % (a,b,c,d,e,f)
    return expr, sol

prefixes = []
for i in range(n):
    expr, sol = generate(types[i])
    prefixes.append(rf"$! \displaystyle {expr} = !$")
    inputs[i].sol = sol
==

question ==
Simplifier les expressions suivantes (en les écrivant sous forme d'entiers ou de fractions irréductibles).
==
