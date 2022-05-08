# Author: D. Doyen
# Tags: fractions, algebraic operations, lcm
# Simplifier une somme de fractions avec de grands dénominateurs
# Parameters:
# - terms: nombre de termes
# 19/7/2021

extends = /model/math/multimathinput.pl

title = Calculer avec des fractions

param.types = [0, 1]

before ==
from math import gcd

types = param['types']
n = len(types)
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(ind):

    if ind == 0:
        n=2
        k=choice([11,12,13,14,15,16,17,18,19])
    if ind == 1:
        n=3
        k=choice([7,9,11,13,14,15])

    a=[randint(2,5) for _ in range(n)]
    b=sampleint(2,5, n)
    f=[]
    for i in range(len(b)):
        b[i]=k*b[i]
        while gcd(a[i],b[i])!=1:
            a[i]=randint(1,5) 
        f.append('\\frac{ %d }{ %d }' % (a[i],b[i]))

    s1=choice(["-","+"])
    s2=choice(["-","+"])

    if ind == 0:
        expr='%s %s %s' % (f[0],s1,f[1])
    if ind == 1:
        expr='%s %s %s %s %s' % (f[0],s1,f[1],s2,f[2])

    sol = simplify(latex2sympy(expr))
    return expr, sol

prefixes = []
for i in range(n):
    expr, sol = generate(types[i])
    prefixes.append(rf"$! \displaystyle {expr} = !$")
    inputs[i].sol = sol
==

question ==
Calculer les expressions suivantes en les écrivant sous la forme d'un entier ou d'une fraction irréductible.
==