extends = /model/math/input.pl

before ==
from sympy import Symbol, ln
from sympy2latex import latex
v = Symbol('t')
expr = ln(v) + 1/(1 + v**2)
expr_latex = latex(expr)
==

question ==
Soit la fonction $! f : \mathbb{R} \rightarrow \mathbb{R} !$ telle que
$$ f(x) = {{ expr_latex }} . $$
==