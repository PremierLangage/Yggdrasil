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
a=rd.randint(10,20)
b=rd.randint(10,20)
f=sin(3)
==

text ==
{{f}}
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"")
    else:
        grade=(0,"%d + %d = %d" % (a,b,a+b))
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==





