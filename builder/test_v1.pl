@ /builder/before_v1.py [builder.py]
@ /grader/evaluator_v1.py [grader.py]
@ /utils/pljson.py
@ /utils/pljinja.py
@ /model/json_coder/json_coder_sympy.py [json_coder.py]
@ /model/jinja_env/jinja_env_sympy2latex.py [jinja_env.py]
@ /model/namespace/namespace_math.py [namespace.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py

title = Multiplication de deux nombres complexes

before ==
z = 2 - 2*I
var('x')
P = x**2 - 3*x + 1
==

text ==
$$ {{ z|latex }} $$ 

$$ {{ P|latex }} $$
==

input =: Input

form ==
{{ input|component }}
==

evaluator ==
w = 2*z
score = 100
feedback = latex(w)
==

