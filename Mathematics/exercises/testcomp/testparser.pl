@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
b = 2
==

evaluator== #|python|
grade = (100, 'OK')
==

#! linter:require:a::str


title== #|html|
==

text == #|html|
{{ b }}
==

form == #|html|
==