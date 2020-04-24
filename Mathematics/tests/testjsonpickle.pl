@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
class Foo:
    def __init__(a, b):
        self.a = a
        self.b = b

class Bar:
    def __init__(x, y):
        self.x = a
        self.y = b
        self.z = 0

o = Bar(Foo(1, [3,4]), {'key1': 11, 'key2': 22})
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==

