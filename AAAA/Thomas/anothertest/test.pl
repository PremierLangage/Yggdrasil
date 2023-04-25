
@ test.html

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ before.py

before ==#|py|

with open("test.html", "r") as f:
    form = f.read()

==

title = Radio Group Component

text==
Select the result of **{{ A }}** x **{{ B }}**.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
Coucou les copains
==

# EVALUATE THE STUDENT ANSWER
evaluator==
==

