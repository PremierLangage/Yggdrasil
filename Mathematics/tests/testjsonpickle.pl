@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
class Foo:
    def __init__(self, a, b):
        self.a = a
        self.b = b

class Bar:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.z = 0

obj = Bar(Foo(1, [3,4]), {'key1': 11, 'key2': 22})

import jsonpickle
obj_encoded = jsonpickle.encode(obj, unpicklable=False)

a = {1: 1, 2: 2, 3: 3, 4: 4}
b = {2: 2, 3: 3, 1: 1, 4: 4}

a_encoded = jsonpickle.encode(a, unpicklable=False)
b_encoded = jsonpickle.encode(b, unpicklable=False)
==

text ==
{{obj_encoded}}
==

form ==

==

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==

