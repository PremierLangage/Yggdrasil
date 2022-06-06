extends = /model/math/multimathinput.pl

title = Intervalle et distance

before ==
inputs = [MathInput(type="expr"), MathInput(type="expr")]
prefixes = ["$! x_0 = !$", "$! r = !$"]
from sympy import solveset, S
var('x')
x0 = randint(1, 6)
r = randint(1, 5)
lhs = Abs(x - x0)

if randint(0, 1) == 0:
    ineq = lhs < r
    symb = "<"
else:
    ineq = lhs <= r
    symb = "\leq"

interv = solveset(ineq, x, domain=S.Reals)
inputs[0].sol = x0
inputs[1].sol = r
==

question ==
Ecrire l'intervalle $! {{ interv|latex }} !$ sous la forme $! |x - x_0| {{ symb }} r !$.
==
