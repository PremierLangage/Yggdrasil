
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

@ content.csv 
@ ../mkl.py

@ readcsv.py [readcsv.py]

before==
import random,readcsv, mkl

group.items,solution, debug = readcsv.getrandomselection(sourcecol="target",targetcol="source")


==

title = Checkbox Group Component

text==
Select even numbers.
{{group.items}} 
{{solution}}
{{debug}}
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = int(item['content'])
    if content % 2 == 0:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==


