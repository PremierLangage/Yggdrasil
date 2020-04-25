@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /utils/sympy/sympy2latex.py
@ /model/serialization/JSONEncoder.py [serialize.py]

extends = /model/mathinput.pl
@ /builder/before.py [builder.py]

title = Addition

before ==
str = json
==

text ==
{{xxx}}
==

form ==

==

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==


