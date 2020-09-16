from pljinja import DefaultEnv as Env
from sympy2latex import latex

Env.filters["latex"] = latex
