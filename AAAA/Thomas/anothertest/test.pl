
@ test3.html
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

with open("test3.html", "r") as f:
    form = f.read()
==

title = Radio Group Component

text==
Select the result of **{{ A }}** x **{{ B }}**.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
==

# EVALUATE THE STUDENT ANSWER
evaluator==
==

