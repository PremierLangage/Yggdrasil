extends = /model/math/input.pl

before ==
from sympy import Symbol, ln
v = Symbol('t')
expr = ln(v) + 1/(1 + v**2)
==

question ==
Soit la fonction $! f : \mathbb{R} \rightarrow \mathbb{R} !$ telle que
$$ f(x) = {{ expr|latex }} . $$
==