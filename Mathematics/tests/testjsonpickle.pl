@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
class Foo:
    def __init__(number, dict):
        self.number = number
        self.dict = dict

class Bar:
    def __init__(a, b):
        self.a = a
        self.b = b
        self.c = 0
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

