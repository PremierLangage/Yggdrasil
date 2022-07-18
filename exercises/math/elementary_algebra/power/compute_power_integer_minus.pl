# Author: D. Doyen
# Tags: power
# Calculer avec des puissances
# 19/7/2021

extends = /model/math/multimathinput.pl

before ==
from sympy import evaluate, Pow
n = 4
inputs = [MathInput(type="expr") for _ in range(n)]

def rand_coeff(case):
    a=randint(1,5)
    b=randint(-3,-1)
    c=randint(2,4)
    if case==0:
        return ("",-a,b)
    if case==1:
        return ("",-a,c)
    if case==2:
        return ("-",-a,b)
    if case==3:
        return ("-",-a,c)
    if case==4:
        return ("",a,b)
    if case==5:
        return ("-",a,b)

def latex_number(s,x,y):
    if x<0:
        return "%s ( %d )^{ %d }" % (s,x,y)
    else:
        return "%s %d ^{ %d }" % (s,x,y)



prefixes = []
case=sampleint(0,5,4)
for i in range(n):
    s,x,y=rand_coeff(case[i])
    prefixes.append(f"$! {latex_number(s,x,y)} = !$")
    inputs[i].sol = simplify(int(s+"1")*Pow(x,y))
==

question ==
Calculer les expressions suivantes.
==