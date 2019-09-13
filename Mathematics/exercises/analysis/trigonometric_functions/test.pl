@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title =

text =

before== #|python|

==


input1 =: MathInput


form==
{{input1|component}}
==

evaluator==#|python|
grade = (100, input1.value);
==


