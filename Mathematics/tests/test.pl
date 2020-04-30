@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
import sympy as sp
import sympy.parsing.sympy_parser as prs

from sympy.parsing.sympy_parser import parse_expr, standard_transformations, implicit_multiplication)

transformations = standard_transformations + (implicit_multiplication,)
sp.var('R', real=True)
local_dict = {'R': R}
expr = parse_expr("R(1+R)", local_dict=local_dict, transformations=transformations, evaluate=False)
s = sp.srepr(expr)
s = sp.__version__
==

text ==
{{s}}
==

form ==
==

evaluator ==
grade = (100, "")
==




