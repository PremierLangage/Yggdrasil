@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
import sympy.parsing.sympy_parser as prs

sp.var('R', real=True)
transformations = (prs.standard_transformations + (prs.implicit_multiplication_application,))
local_dict = {'R': R}
expr = prs.parse_expr("R(1+R)",local_dict=local_dict, transformations=transformations,evaluate=False)
s = sp.srepr(expr)
==

text ==
{{s}}
==

form ==
==

evaluator ==
grade = (100, "")
==




