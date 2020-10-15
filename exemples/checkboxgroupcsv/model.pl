
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

solutionvalue =random.choice(solution)
group.index = [ i for i,x in enumerate(solution) if x==solutionvalue ]

==

title = Checkbox Group Component

text==
Indiquez ceux qui sont des {{solutionvalue}}

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
    if content == "solution:
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



