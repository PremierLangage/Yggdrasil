@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
class Foo:
    def __init__(self, a, b):
        self.a = a
        self.b = b

Foo(1,2)
==

text ==

==

form ==

==

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==

