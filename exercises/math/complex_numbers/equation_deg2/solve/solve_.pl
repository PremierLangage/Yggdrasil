# Author: D. Doyen
# Tags: complex numbers, quadratic equations, roots
# Déterminer les solutions (complexes) d'une équation quadratique.
# Parameters:
# - roots: list de chaînes indiquant 
# les types de racines
# 19/7/2021

title = Equation du second degré à coefficients complexes


extends = /model/math/set.pl

param.roots = "int1"

wobracket = True

symbol_dict = {'e': E, 'i': I}

before ==
from evalsympy import equal
from sympy import solveset, S, expand

a = randint(-4, 4, [0])
b = randint(-4, 4, [0])
a2 = randint(-3, 3, [0])
b2 = randint(-3, 3, [0])
while equal(a-b*I,a2+b2*I):
    a2 = randint(-3, 3, [0])
    b2 = randint(-3, 3, [0])

c = randint(-5,5,[0,1,-1])
s = choice([-1,1])
s2 = choice([-I,I,1+I,1-I,I-1])

x = Symbol('z')
if param['roots']=='int1':
    P=s*(x+a+b*I)*(x+a2+b2*I)
if param['roots']=='int2':
    P=s2*(x+a+b*I)*(x+a2+b2*I)
if param['roots']=='rat1':
    P=s*(c*x+a+b*I)*(c*x+a2+b2*I)
sol=list(solveset(P,x,domain=S.Complexes))
P = Poly(expand(P),x)
solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(sol[0]),latex(sol[1]))
==

question ==
Déterminer les solutions (complexes) de l'équation $! {{ P|latex }} = 0 !$. Séparer les différentes solutions par une virgule.
==