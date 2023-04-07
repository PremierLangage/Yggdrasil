@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@databas_utils.py 

inputbox =: Input
inputbox.placeholder = Ta réponse
inputbox.appearance = outline

before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Input Component
==

text==
Enter the result of ** {{ a }} + {{ b }} ** inside the input box.
==

form==
{{ inputbox|component}}
==

evaluator==
if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==
