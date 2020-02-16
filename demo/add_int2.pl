@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/serialize_sympy.py [serialize.py]
@ /utils/env_math.py [env.py]
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath2.py [utilsmath.py]
@ /utils/keyboards.JSON [keyboards.JSON]

title = Addition

before ==
a=3+I
b=1-I
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

evaluator ==
c = a + b
grade=(100,latex(c))
==





