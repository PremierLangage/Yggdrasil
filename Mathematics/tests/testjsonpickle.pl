@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /utils/sympy/sympy2latex.py
@ /model/serialization/JSONEncoder.py [serialize.py]

title = Addition

before ==
class Foo:
    def __init__(self, a, b):
        self.a = a
        self.b = b
a=3
xxx = Foo(1,2)
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


