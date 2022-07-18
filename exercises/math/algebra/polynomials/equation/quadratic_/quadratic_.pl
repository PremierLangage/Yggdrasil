# D. Doyen
# polynomials, polynomial equation, quadratic equation, quadratic polynomials, roots
# Déterminer les solutions d'une équation quadratique.
# 31/5/22

# Parameters
# roots
# "int" : two integer roots
# "intrat" : one integer root and one rational root
# "rat" : two rational roots

extends = /model/math/set.pl

title = Equation du second degré

wobracket = True

before ==
from sympy import factor, content, solveset, S
var('x')

q, r = sample([1, 2, 3, 4, 5], 2)
q = choice([-1,1])*q
r =choice([-1,1])*r
[b, a], [d, c] = sample([[1,2],[3,2],[5,2],[1,3],[2,3],[4,3],[5,3],[1,4],[3,4],[5,4],[1,5],[2,5],[3,5],[4,5]], k=2)
a=choice([-1,1])*a
c=choice([-1,1])*c

if param['roots'] == "int":
    P = (x-q)*(x-r)
elif param['roots'] == "intrat":
    P = (x-q)*(a*x-b)
elif param['roots']=="rat":
    P = (a*x-b)*(c*x-d)

P = choice([-1,1])*choice([1 , 2])*P/content(P)

sol = solveset(P, x, domain=S.Reals)
P = P.expand()
==


question ==
Déterminer les solutions de l'équation 
$$ {{P|latex}} = 0. $$
Séparer les différentes solutions par une virgule.
==