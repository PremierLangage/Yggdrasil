extends = /model/math/input.pl

before ==
from sympy import Symbol
from sympy2latex import latex
x = Symbol('x')
expr = 1/(1 + x**2)
expr_latex = latex(expr)
==

question ==
Soit la fonction $! f : \mathbb{R} \rightarrow \mathbb{R} !$ telle que
$$ f(x) = {{ expr_latex }} . $$
==