@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
b = a + a 
==

evaluator== #|python|
grade = (100, 'OK')
==

#
a ={int} 3

title== #|html|
==

text == #|html|
{{ b }}
==

form == #|html|
==