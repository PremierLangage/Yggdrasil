@ /builder/before_v1.py [builder.py]
@ /grader/evaluator_v1.py [grader.py]
@ /model/json_coder/json_coder_sympy.py [json_coder.py]
@ /model/jinja_env/jinja_env_math.pl [jinja_env.py]
@ /model/namespace/namespace_math.py [namespace.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py

title = Multiplication de deux nombres complexes

before ==
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

form ==
{{ input|component }}
==

evaluator ==
score, _, feedback = eval_complex(input.value, sol, form="cartesian")
==
